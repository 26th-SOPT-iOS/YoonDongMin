//
//  UIImageView+Extension.swift
//  26th_iOS_firstAssignment
//
//  Created by 윤동민 on 2020/05/27.
//  Copyright © 2020 윤동민. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(from url: String) {
        // URL이 들어오는 것을 Cache 키로 사용
        let cache = ImageCache.default
        cache.removeImage(forKey: url)
        self.kf.indicatorType = .activity
        cache.retrieveImage(forKey: url) { result in
            switch result {
            // 캐시에 이미지가 있는 경우
            case .success(let value):
                switch value.cacheType {
                // setImage을 호출 시, 자동으로 캐시에 저장하고 호출함
                case .none: self.kf.setImage(with: URL(string: url)!, placeholder: UIImage(systemName: "pencil"), options: [.transition(.fade(1))])
                case .memory: self.image = value.image
                case .disk: self.image = value.image
                }
            case .failure(let error):
                print(error.errorCode)
                self.image = UIImage()
            }
        }
    }
}
