//
//  FirstViewController.swift
//  26_iOS_firstWeek_Seminar
//
//  Created by 윤동민 on 2020/03/20.
//  Copyright © 2020 윤동민. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var sampleSwitch: UISwitch!
    @IBOutlet weak var sampleSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func transferData(_ sender: Any) {
        guard let receiveViewController = self.storyboard?.instantiateViewController(identifier: "secondViewController") as? SecondViewController else { return }
        
        receiveViewController.name = nameTextField.text
        receiveViewController.email = emailTextField.text
        receiveViewController.isOnOff = sampleSwitch.isOn
        receiveViewController.frequency = sampleSlider.value
        self.present(receiveViewController, animated: true, completion: nil)
    }
}
