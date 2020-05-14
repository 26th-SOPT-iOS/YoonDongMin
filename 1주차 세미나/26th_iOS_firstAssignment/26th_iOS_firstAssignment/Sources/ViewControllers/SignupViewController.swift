//
//  SigninViewController.swift
//  26th_iOS_firstAssignment
//
//  Created by 윤동민 on 2020/03/27.
//  Copyright © 2020 윤동민. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {
    
    static let identifier = "SignupViewController"
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwdTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
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
        
    }
}
