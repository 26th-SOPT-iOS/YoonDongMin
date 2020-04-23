//
//  ViewController.swift
//  26th_secondWeek_Seminar
//
//  Created by 윤동민 on 2020/04/24.
//  Copyright © 2020 윤동민. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sampleScrollView: UIScrollView!
    @IBOutlet weak var sampleStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        sampleScrollView.contentInset = UIEdgeInsets(top: 30, left: 0, bottom: 30, right: 0)
        addSubView()
    }

    private func addSubView() {
        for index in 0...10 {
            let sampleView: UIView = {
                let tempView = UIView()
                tempView.backgroundColor = UIColor(displayP3Red: CGFloat(index * 20) / 255, green: 0, blue: 1, alpha: 1)
                tempView.translatesAutoresizingMaskIntoConstraints = false
                tempView.heightAnchor.constraint(equalToConstant: 200).isActive = true
                return tempView
            }()
            sampleStackView.addArrangedSubview(sampleView)
        }
    }
}

