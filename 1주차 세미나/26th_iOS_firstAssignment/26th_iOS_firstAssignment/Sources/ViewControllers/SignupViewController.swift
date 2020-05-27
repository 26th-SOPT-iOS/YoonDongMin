//
//  SigninViewController.swift
//  26th_iOS_firstAssignment
//
//  Created by 윤동민 on 2020/03/27.
//  Copyright © 2020 윤동민. All rights reserved.
//

import UIKit
import Alamofire

extension NSNotification.Name {
    static let completeSignup = NSNotification.Name("completeSignup")
}

class SignupViewController: UIViewController {
    static let identifier = "SignupViewController"
    
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwdTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setButtons()        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavi()
    }
    
    private func setNavi() {
        guard let naviBar = self.navigationController?.navigationBar else { return }
        naviBar.isHidden = false
        naviBar.topItem?.title = ""
        naviBar.tintColor = UIColor.royal
        naviBar.setBackgroundImage(UIImage(), for: .default)
        naviBar.shadowImage = UIImage()
    }
    
    private func setButtons() {
        signupButton.backgroundColor = .royal
        signupButton.layer.cornerRadius = signupButton.frame.width / 12.5
        signupButton.clipsToBounds = false
    }
    
    @IBAction func signup(_ sender: Any) {
        guard let id = idTextField.text else { return }
        guard let pwd = pwdTextField.text else { return }
        guard let name = nameTextField.text else { return }
        guard let email = emailTextField.text else { return }
        guard let phone = phoneTextField.text else { return }
        
        SignupService.shared.signup(id: id, password: pwd, name: name, email: email, phone: phone) { networkResult in
            switch networkResult {
            case .success:
                self.navigationController?.popViewController(animated: true)
                NotificationCenter.default.post(name: .completeSignup, object: nil, userInfo: ["id": id, "pwd": pwd])
            case .requestErr(let message):
                guard let message = message as? String else { return }
                let alertController = UIAlertController(title: "회원가입 실패", message: message, preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                alertController.addAction(alertAction)
                self.present(alertController, animated: true, completion: nil)
            case .pathErr: print("")
            case .serverErr: print("")
            case .networkFail: print("")
            }
        }
    }
}
