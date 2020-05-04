//
//  ViewController.swift
//  26_iOS_firstWeek_Seminar
//
//  Created by 윤동민 on 2020/03/04.
//  Copyright © 2020 윤동민. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func goRedView(_ sender: Any) {
        guard let redViewController = self.storyboard?.instantiateViewController(identifier: "redViewController") as? RedViewController else { return }
//        redViewController.modalTransitionStyle = .crossDissolve
//        redViewController.modalPresentationStyle = .automatic
        self.navigationController?.pushViewController(redViewController, animated: true)
    }
    
    @IBAction func goPurpleView(_ sender: Any) {
        guard let purpleViewController = self.storyboard?.instantiateViewController(identifier: "purpleViewController") as? PurpleViewController else { return }
        self.navigationController?.pushViewController(purpleViewController, animated: true)
    }
}

