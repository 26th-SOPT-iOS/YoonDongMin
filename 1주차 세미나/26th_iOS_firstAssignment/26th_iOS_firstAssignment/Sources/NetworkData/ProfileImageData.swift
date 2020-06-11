//
//  ProfileImageData.swift
//  26th_iOS_firstAssignment
//
//  Created by 윤동민 on 2020/06/11.
//  Copyright © 2020 윤동민. All rights reserved.
//

import Foundation

struct ProfileImageData: Codable {
    var status: Int
    var success: Bool
    var message: String
    var data: UserDetailProfile?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case success = "success"
        case message = "message"
        case data = "data"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = (try? values.decode(Int.self, forKey: .status)) ?? -1
        success = (try? values.decode(Bool.self
            , forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode(UserDetailProfile.self, forKey: .data)) ?? nil
    }
}

struct UserDetailProfile: Codable {
    var id: String
    var name: String
    var email: String
    var phone: String
    var image: String
}
