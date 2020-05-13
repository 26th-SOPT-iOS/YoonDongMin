//
//  NetworkResult.swift
//  26th_iOS_firstAssignment
//
//  Created by 윤동민 on 2020/05/13.
//  Copyright © 2020 윤동민. All rights reserved.
//

import Foundation


enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
