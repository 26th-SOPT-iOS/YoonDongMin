//
//  WaetherCell.swift
//  26th_iOS_thirdWeek
//
//  Created by 윤동민 on 2020/05/04.
//  Copyright © 2020 윤동민. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    static let identifier: String = "WeatherCell"
    
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setDateInformation(weatherImageName: String, date: String, subTitle: String) {
        weatherImageView.image = UIImage(named: weatherImageName)
        dateLabel.text = date
        subTitleLabel.text = subTitle
    }
}
