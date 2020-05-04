//
//  ViewController.swift
//  26th_Seminar_FirstWeek
//
//  Created by 윤동민 on 2020/03/02.
//  Copyright © 2020 윤동민. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func goPurpleScreen(_ sender: Any) {
        guard let purpleViewController = self.storyboard?.instantiateViewController(identifier: PurpleViewController.identifier) as? PurpleViewController else { return }
        self.navigationController?.pushViewController(purpleViewController, animated: true)
    }
    
    @IBAction func goREDScreen(_ sender: Any) {
        guard let redViewController = self.storyboard?.instantiateViewController(identifier: REDViewController.identifier) as? REDViewController else { return }
        self.navigationController?.pushViewController(redViewController, animated: true)
    }
}

