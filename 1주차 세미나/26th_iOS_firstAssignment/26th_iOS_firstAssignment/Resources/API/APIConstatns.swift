//
//  APIConstatns.swift
//  26th_iOS_firstAssignment
//
//  Created by 윤동민 on 2020/05/13.
//  Copyright © 2020 윤동민. All rights reserved.
//

import Foundation

struct APIConstants {
    static let baseURL = "http://13.209.144.115:3002"
    static let signinURL = APIConstants.baseURL + "/user/signin"
    static let signupURL = APIConstants.baseURL + "/user/signup"
    static let imageURL = "https://public.codesquad.kr/jk/storeapp/data/7674311a02ba7c88675f3186ddaeef9e.jpg"
    static let profileURL = APIConstants.baseURL + "/user/profile"
}
