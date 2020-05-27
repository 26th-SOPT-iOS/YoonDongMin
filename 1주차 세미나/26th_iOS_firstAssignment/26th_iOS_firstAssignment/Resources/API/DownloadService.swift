//
//  DownloadService.swift
//  26th_iOS_firstAssignment
//
//  Created by 윤동민 on 2020/05/27.
//  Copyright © 2020 윤동민. All rights reserved.
//

import Foundation

struct DownloadService {
    static let shared = DownloadService()
    
    func download(from url: String, session: URLSession, complection: @escaping (NetworkResult<Any>) -> Void) {
        guard let url = URL(string: url) else { return }
        let request = URLRequest(url: url)
        var cachePath = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first
        cachePath?.appendPathComponent(url.lastPathComponent)
        
        let downloadTask = session.downloadTask(with: request) { location, response, error in
            guard let response = response as? HTTPURLResponse else { return }
            switch response.statusCode {
            case 200:
                try? FileManager.default.copyItem(at: location!, to: cachePath!)
                complection(.success(cachePath))
            case 400: complection(.pathErr)
            case 500: complection(.serverErr)
            default: complection(.networkFail)
            }
        }
        
        if !FileManager.default.fileExists(atPath: cachePath!.absoluteString) { downloadTask.resume() }
        else { complection(.success(cachePath!)) }
    }
}
