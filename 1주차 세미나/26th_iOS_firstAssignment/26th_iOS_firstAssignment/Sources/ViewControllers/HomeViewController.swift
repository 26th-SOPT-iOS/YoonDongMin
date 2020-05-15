//
//  HomeViewController.swift
//  26th_iOS_firstAssignment
//
//  Created by 윤동민 on 2020/04/24.
//  Copyright © 2020 윤동민. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var logoHeightConstraint: NSLayoutConstraint!
    private let initHeight: CGFloat = -210
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mainScrollView.delegate = self
        mainScrollView.contentInset = UIEdgeInsets(top: -initHeight, left: 0, bottom: 0, right: 0)
    }
    
    @IBAction func logout(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "autoLogin")
        UserDefaults.standard.removeObject(forKey: "token")
        UserDefaults.standard.removeObject(forKey: "id")
        UserDefaults.standard.removeObject(forKey: "pwd")
        guard let loginController = self.storyboard?.instantiateViewController(identifier: "customNavigationController") as? UINavigationController else { return }
        loginController.modalPresentationStyle = .fullScreen
        self.present(loginController, animated: true, completion: nil)
    }
}

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetY = scrollView.contentOffset.y
        
        if contentOffsetY > initHeight && contentOffsetY < -100 {
            logoHeightConstraint.constant = -contentOffsetY
        } else if contentOffsetY < initHeight {
            logoHeightConstraint.constant = -contentOffsetY
        } else { return }
    }
}
