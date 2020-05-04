//
//  AudioPlayerView.swift
//  26th_iOS_thirdWeek
//
//  Created by 윤동민 on 2020/05/03.
//  Copyright © 2020 윤동민. All rights reserved.
//

import UIKit

// AudioPlayerView에 필요한 액션을 위한 프로토콜
// 1. 플레이, 정지 버튼을 눌렀을 때 행동을 정의
// 2. 플레이리스트 버튼을 눌렀을 때 행동을 정의
protocol AudioPlayerDelegate {
    func playPauseDidTap()
    func playlistDidTap()
}

// 처리하라고 시키는 객체
class AudioPlayerView: UIView {
    @IBOutlet weak private var playpauseButton: UIButton?
    @IBOutlet weak private var playListButton: UIButton?
    
    var delegate: AudioPlayerDelegate?
    
    // 플레이, 정지 버튼을 눌렀을 때 일어날 이벤트
    @IBAction func tappedPlayPauseButton(_ sender: Any) {
        delegate?.playPauseDidTap()
    }
    
    // 플레이리스트 버튼을 눌렀을 때 일어날 이벤트
    @IBAction func tappedPlayListButton(_ sender: Any) {
        delegate?.playlistDidTap()
    }
}
