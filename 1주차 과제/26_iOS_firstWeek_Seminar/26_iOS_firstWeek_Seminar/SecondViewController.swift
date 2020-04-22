//
//  SecondViewController.swift
//  26_iOS_firstWeek_Seminar
//
//  Created by 윤동민 on 2020/03/20.
//  Copyright © 2020 윤동민. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var frequencyLabel: UILabel!
    
    var name: String?                // 이름을 받을 변수
    var email: String?               // 이메일을 받을 변수
    var isOnOff: Bool?               // 스위치 on/off 여부를 받을 변수
    var frequency: Float?            // 빈도를 받을 변수
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setLabels()
    }
    
    private func setLabels() {
        // Optional Biding
        guard let name = self.name else { return }
        guard let email = self.email else { return }
        guard let isOnOff = self.isOnOff else { return }
        guard let frequency = self.frequency else { return }
        
        // Label에 값 대입
        nameLabel.text = name
        emailLabel.text = email
        switchLabel.text = isOnOff ? "On" : "Off"
        frequencyLabel.text = "\(frequency)"
    }
    
    
    @IBAction func backScreen(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
