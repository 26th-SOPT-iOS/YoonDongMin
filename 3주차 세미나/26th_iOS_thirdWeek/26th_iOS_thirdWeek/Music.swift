//
//  Music.swift
//  26th_iOS_thirdWeek
//
//  Created by 윤동민 on 2020/05/03.
//  Copyright © 2020 윤동민. All rights reserved.
//

import UIKit

struct Music {
    var albumImg: UIImage?
    var musicTitle: String
    var singer: String
    
    init(coverName: String, musicTitle: String, singer: String) {
        self.albumImg = UIImage(named: coverName)
        self.musicTitle = musicTitle
        self.singer = singer
    }
}
