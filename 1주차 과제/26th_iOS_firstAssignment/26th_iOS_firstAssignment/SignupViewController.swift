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
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func doSignup(_ sender: Any) {
        guard let mainViewController = self.storyboard?.instantiateViewController(identifier: MainViewController.identifier) as? MainViewController else { return }
        mainViewController.id = idTextField.text
        mainViewController.pw = pwTextField.text
        self.present(mainViewController, animated: true) {
            self.navigationController?.popViewController(animated: false)
        }
    }
}
