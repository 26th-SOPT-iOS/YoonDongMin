//
//  ViewController.swift
//  26th_iOS_firstAssignment
//
//  Created by 윤동민 on 2020/03/27.
//  Copyright © 2020 윤동민. All rights reserved.
//

import UIKit
import BEMCheckBox

protocol LoginAble {
    var logicLogin: (NetworkResult<Any>) -> Void { get }
}

class ViewController: UIViewController {
    @IBOutlet var backgroundViews: [UIView]!
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var guidLabel: UILabel!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var autoLoginCheckButton: BEMCheckBox!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setButtons()
        setTextField()
        addObserver()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavi()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        autoLoginCheckButton.setOn(false, animated: true)
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
    
    private func addObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(autoLogin(_:)), name: .completeSignup, object: nil)
    }
    
    @objc func autoLogin(_ notification: NSNotification) {
        guard let id = notification.userInfo?["id"] as? String else { return }
        guard let pwd = notification.userInfo?["pwd"] as? String else { return }
        idTextField.text = id
        pwTextField.text = pwd
        
        LoginService.shared.login(id: id, pwd: pwd, completion: logicLogin)
    }
    
    @IBAction func login(_ sender: Any) {
        guard let inputID = idTextField.text else { return }
        guard let inputPWD = pwTextField.text else { return }
        
        LoginService.shared.login(id: inputID, pwd: inputPWD, completion: logicLogin)
    }
}

extension ViewController: LoginAble {
    var logicLogin: (NetworkResult<Any>) -> Void {
        return { (networkResult) in
            switch networkResult {
            case .success(let token):
                guard let token = token as? String else { return }
                guard let id = self.idTextField.text else { return }
                guard let pwd = self.pwTextField.text else { return }
                if self.autoLoginCheckButton.on { DataHandler.shared.save(id, pwd) }
                UserDefaults.standard.set(token, forKey: "token")
                print(token)
                guard let tabbarController = self.storyboard?.instantiateViewController(identifier: "customTabbarController") as? UITabBarController else { return }
                tabbarController.modalPresentationStyle = .fullScreen
                UIApplication.shared.windows.filter { $0.isKeyWindow }.first?.rootViewController = tabbarController
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
            ()
        }
    }
}
