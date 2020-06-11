//
//  FriendViewController.swift
//  26th_iOS_firstAssignment
//
//  Created by 윤동민 on 2020/05/27.
//  Copyright © 2020 윤동민. All rights reserved.
//

import UIKit

class FriendViewController: UIViewController {
    
    private var pickerController = UIImagePickerController()
    @IBOutlet weak var freindTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setTableView()
        pickerController.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        lookupProfile()
    }
    
    private func lookupProfile() {
        guard let token = UserDefaults.standard.object(forKey: "token") as? String else { return }
        LookupService.shared.lookup(token) { networkResult in
            switch networkResult {
            case .success(let profileData):
                guard let profileData = profileData as? UserDetailProfile else { return }
                print(profileData.image)
                let image = UIImageView()
                image.setImage(from: profileData.image) { image in
                    guard let profileCell = self.freindTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? MyProfileCell else { return }
                    DispatchQueue.main.async { profileCell.profileImage = image }
                }
            case .requestErr(let message): print(message)
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("ServerErr")
            case .networkFail:
                print("networkReult")
            }
        }
    }
    
    private func setTableView() {
        freindTableView.delegate = self
        freindTableView.dataSource = self
        freindTableView.separatorStyle = .none
    }
}

extension FriendViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 { return 1 }
        else { return 10 }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let myProfileCell = tableView.dequeueReusableCell(withIdentifier: MyProfileCell.identifier) as? MyProfileCell else { return UITableViewCell() }
            myProfileCell.indexPath = indexPath
            myProfileCell.delegate = self
            myProfileCell.selectionStyle = .none
            myProfileCell.name = "윤동민"
            return myProfileCell
        } else {
            guard let friendCell = tableView.dequeueReusableCell(withIdentifier: FriendCell.identifier) as? FriendCell else { return UITableViewCell() }
            friendCell.selectionStyle = .none
            friendCell.name = "박솝트"
            friendCell.message = "왈왈멍멍ㅁ!!ㅁ얾왊어엉머어"
            return friendCell
        }
    }
}

extension FriendViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 { return CGFloat.leastNormalMagnitude }
        else { return 30 }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 {
            return {
                let backView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 30))
                let countLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
                countLabel.font = UIFont.systemFont(ofSize: 11)
                countLabel.text = "친구\(10)"
                countLabel.textColor = UIColor(red: 129/255, green: 129/255, blue: 129/255, alpha: 1.0)
                backView.addSubview(countLabel)
                countLabel.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    countLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 16),
                    countLabel.centerYAnchor.constraint(equalTo: backView.centerYAnchor)
                ])
                return backView
            }()
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 { return 80 }
        else { return 60  }
    }
}

extension FriendViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func openLibrary() {
        pickerController.sourceType = .photoLibrary
        self.present(pickerController, animated: true, completion: nil)
    }
    
    func openCamera() {
        pickerController.sourceType = .camera
        self.present(pickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage, let url = info[UIImagePickerController.InfoKey.imageURL] as? URL {
            
            guard let token = UserDefaults.standard.object(forKey: "token") as? String else { return }
            UploadService.shared.uploadImage(token, image, url.lastPathComponent) { networkResult in
                switch networkResult {
                case .success(let profileData):
                    guard let profileData = profileData as? [UserProfile] else { return }
                    print(profileData[0].profile)
                    guard let profileCell = self.freindTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? MyProfileCell else { return }
                    profileCell.profileImage = image
                case .requestErr(let failMessage):
                    guard let message = failMessage as? String else { return }
                    print(message)
                case .pathErr:
                    print("pathErr")
                case .serverErr:
                    print("serverErr")
                case .networkFail:
                    print("networkFail")
                }
            }
        }
        dismiss(animated: true, completion: nil)
    }
}

extension FriendViewController: ButtonDelegate {
    func onClickCellButton(in index: Int) {
        let alertController = UIAlertController(title: "사진 선택", message: "가져올 곳을 선택하세요", preferredStyle: .actionSheet)
        let galleryAction = UIAlertAction(title: "사진앨범", style: .default) { action in
            self.openLibrary()
        }
        
        let photoAcgtion = UIAlertAction(title: "카메라", style: .default) { action in
            self.openCamera()
        }
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alertController.addAction(galleryAction)
        alertController.addAction(photoAcgtion)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

