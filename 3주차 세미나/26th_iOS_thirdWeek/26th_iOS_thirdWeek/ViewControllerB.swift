//
//  ViewControllerB.swift
//  26th_iOS_thirdWeek
//
//  Created by 윤동민 on 2020/05/03.
//  Copyright © 2020 윤동민. All rights reserved.
//

import UIKit

class ViewControllerB: UIViewController {
    var audioPlayer: AudioPlayerView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        audioPlayer = AudioPlayerView()
        audioPlayer?.delegate = self
    }
}

extension ViewControllerB: AudioPlayerDelegate {
    func playPauseDidTap() {
        print("B Player Play or Pause")
    }
    
    func playlistDidTap() {
        print("B PlayList Clicked")
    }
}


