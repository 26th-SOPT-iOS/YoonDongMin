//
//  ViewController.swift
//  26th_iOS_firstAssignment
//
//  Created by 윤동민 on 2020/03/27.
//  Copyright © 2020 윤동민. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    @IBOutlet var buttons: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setButtons()
    }

    private func setButtons() {
        for button in buttons {
            button.layer.cornerRadius = button.frame.width / 20
            button.layer.shadowOffset = .zero
            button.layer.shadowRadius = 16
            button.layer.shadowColor = UIColor.black.cgColor
            button.layer.shadowOpacity = 0.4
        }
    }
    
    @IBAction func login(_ sender: Any) {
        guard let mainViewController = self.storyboard?.instantiateViewController(identifier: MainViewController.identifier) as? MainViewController else { return }
        mainViewController.id = idTextField.text
        mainViewController.pw = pwTextField.text
        self.present(mainViewController, animated: true, completion: nil)
    }
}

