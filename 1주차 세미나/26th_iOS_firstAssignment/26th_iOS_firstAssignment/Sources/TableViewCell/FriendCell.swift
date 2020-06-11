//
//  FriendCell.swift
//  26th_iOS_firstAssignment
//
//  Created by 윤동민 on 2020/05/29.
//  Copyright © 2020 윤동민. All rights reserved.
//

import UIKit

class FriendCell: UITableViewCell {
    static let identifier = "FriendCell"

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    var imageName: String? {
        didSet {
            if let imageName = imageName {
                guard let image = UIImage(named: imageName) else { return }
                profileImageView.image = image
            }
        }
    }
    
    var name: String? {
        didSet {
            if let name = name { nameLabel.text = name }
        }
    }
    
    var message: String? {
        didSet {
            if let message = message { messageLabel.text = message }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
