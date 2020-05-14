//
//  ViewController.swift
//  26th_iOS_firstAssignment
//
//  Created by 윤동민 on 2020/03/27.
//  Copyright © 2020 윤동민. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var backgroundViews: [UIView]!
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var guidLabel: UILabel!
    @IBOutlet weak var signupButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setButtons()
        setTextField()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavi()
    }

    private func setButtons() {
        loginButton.backgroundColor = .royal
        loginButton.layer.cornerRadius = loginButton.frame.width / 12.5
        loginButton.clipsToBounds = false
    }
    
    private func setTextField() {
        for eachField in backgroundViews { eachField.layer.cornerRadius = eachField.frame.width / 13.7 }
        idTextField.attributedPlaceholder = NSMutableAttributedString(string: "이메일", attributes: [.foregroundColor: UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1.0), .kern: CGFloat(-0.28)])
        pwTextField.attributedPlaceholder = NSMutableAttributedString(string: "비밀번호", attributes: [.foregroundColor: UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1.0), .kern: CGFloat(-0.28)])
    }
    
    private func setNavi() {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func login(_ sender: Any) {
        guard let inputID = idTextField.text else { return }
        guard let inputPWD = pwTextField.text else { return }
        
        LoginService.shared.login(id: inputID, pwd: inputPWD) { networkResult in
            switch networkResult {
            case .success(let token):
                guard let token = token as? String else { return }
                UserDefaults.standard.set(token, forKey: "token")
                guard let tabbarController = self.storyboard?.instantiateViewController(identifier: "customTabbarController") as? UITabBarController else { return }
                tabbarController.modalPresentationStyle = .fullScreen
                self.present(tabbarController, animated: true, completion: nil)
            case .requestErr(let message):
                guard let message = message as? String else { return }
                let alertViewController = UIAlertController(title: "로그인 실패", message: message, preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                alertViewController.addAction(action)
                self.present(alertViewController, animated: true, completion: nil)
            case .pathErr: print("path")
            case .serverErr: print("serverErr")
            case .networkFail: print("networkFail")
            }
        }
    }
    
    
}

