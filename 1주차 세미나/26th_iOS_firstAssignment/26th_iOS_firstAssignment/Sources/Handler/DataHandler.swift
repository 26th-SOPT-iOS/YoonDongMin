//
//  DataHandler.swift
//  26th_iOS_firstAssignment
//
//  Created by 윤동민 on 2020/05/15.
//  Copyright © 2020 윤동민. All rights reserved.
//

import Foundation

struct DataHandler {
    static let shared = DataHandler()
    
    func save(_ id: String, _ pwd: String) {
        UserDefaults.standard.set(true, forKey: "autoLogin")
        UserDefaults.standard.set(id, forKey: "id")
        UserDefaults.standard.set(pwd, forKey: "pwd")
    }
    
    func load() -> (String, String)? {
        guard let isAutoLogin = UserDefaults.standard.object(forKey: "autoLogin") as? Bool, isAutoLogin else { return nil }
        guard let storedID = UserDefaults.standard.object(forKey: "id") as? String else { return nil }
        guard let storedPW = UserDefaults.standard.object(forKey: "pwd") as? String else { return nil }
        return (storedID, storedPW)
    }
}
