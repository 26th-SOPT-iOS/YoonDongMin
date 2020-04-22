//
//  PurpleViewController.swift
//  26_iOS_firstWeek_Seminar
//
//  Created by 윤동민 on 2020/03/06.
//  Copyright © 2020 윤동민. All rights reserved.
//

import UIKit

class PurpleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backScreen(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
}
