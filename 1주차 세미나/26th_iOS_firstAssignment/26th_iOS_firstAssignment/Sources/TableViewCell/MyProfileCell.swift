//
//  MyProfileCell.swift
//  26th_iOS_firstAssignment
//
//  Created by 윤동민 on 2020/05/29.
//  Copyright © 2020 윤동민. All rights reserved.
//

import UIKit


protocol ButtonDelegate {
    func onClickCellButton(in index: Int)
}

class MyProfileCell: UITableViewCell {
    static let identifier = "MyProfileCell"
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileBtn: UIButton!
    
    var delegate: ButtonDelegate?
    var indexPath: IndexPath?
    
    var name: String? {
        didSet {
            if let name = name { nameLabel.text = name }
        }
    }
    
    var profileImage: UIImage? {
        didSet {
            profileBtn.setImage(profileImage, for: .normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        profileBtn.layer.cornerRadius = profileBtn.frame.width / 2
        profileBtn.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func setProfile(_ sender: Any) {
        delegate?.onClickCellButton(in: indexPath!.row)
    }
}
