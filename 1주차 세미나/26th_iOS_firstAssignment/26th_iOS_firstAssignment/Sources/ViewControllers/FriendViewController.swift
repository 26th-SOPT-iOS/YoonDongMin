//
//  FriendViewController.swift
//  26th_iOS_firstAssignment
//
//  Created by 윤동민 on 2020/05/27.
//  Copyright © 2020 윤동민. All rights reserved.
//

import UIKit

class FriendViewController: UIViewController {
    @IBOutlet weak var profileImageView: UIImageView!
    
    lazy var downloadSession: URLSession = {
        let configutaion = URLSessionConfiguration.default
        return URLSession(configuration: configutaion, delegate: self, delegateQueue: nil)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        profileImageView.setImage(from: APIConstants.imageURL)
        
//        DownloadService.shared.download(from: APIConstants.imageURL, session: downloadSession) { networkResult in
//            switch networkResult {
//            case .success(let path):
//                guard let cachePath = path as? URL else { return }
//                guard let data = try? Data(contentsOf: cachePath) else { return }
//                DispatchQueue.main.async {
//                    self.profileImageView.image = UIImage(data: data)
//                }
//            default:
//                print("error")
//            }
//        }
    }
    
}

extension FriendViewController: URLSessionTaskDelegate, URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print(location.absoluteURL)
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let calculatedProgress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
        print(calculatedProgress)
    }
}
