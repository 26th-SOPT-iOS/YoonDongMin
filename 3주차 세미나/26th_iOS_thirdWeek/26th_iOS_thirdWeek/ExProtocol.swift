//
//  ExProtocol.swift
//  26th_iOS_thirdWeek
//
//  Created by 윤동민 on 2020/05/02.
//  Copyright © 2020 윤동민. All rights reserved.
//

import Foundation

protocol Walkable {
    var leg: Int { get }
    
    func walk()
}

protocol Talkable {
    func talk()
}

class People: Walkable, Talkable {
    var leg: Int {
        return 2
    }
    
    func walk() {
        print(leg)
        print("두 발로 걸어다닙니다.")
    }
    
    func talk() {
        print("안녕하세요")
    }
}

class Dog: Walkable {
    var leg: Int {
        return 4
    }
    
    func walk() {
        print(leg)
        print("네 발로 걸어다닙니다.")
    }
}
