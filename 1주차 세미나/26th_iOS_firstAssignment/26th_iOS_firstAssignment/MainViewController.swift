//
//  MainViewController.swift
//  26th_iOS_firstAssignment
//
//  Created by 윤동민 on 2020/03/27.
//  Copyright © 2020 윤동민. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    static let identifier = "MainViewController"
    var id: String?
    var pw: String?

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var pwLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setLabels()
    }
    
    private func setLabels() {
        guard let id = self.id else { return }
        guard let pw = self.pw else { return }
        idLabel.text = id
        pwLabel.text = pw
    }
    
    @IBAction func logout(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
