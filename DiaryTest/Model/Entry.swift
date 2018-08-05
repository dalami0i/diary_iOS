//
//  Entry.swift
//  DiaryTest
//
//  Created by Edward WonSangjin on 2018. 8. 5..
//  Copyright © 2018년 Edward WonSangjin. All rights reserved.
//

import Foundation


class Entry {
    let id: Int
    let createdAt: Date
    var text: String
    
    init(id: Int, createdAt: Date, text: String) {
        self.id = id
        self.createdAt = createdAt
        self.text = text
    }
}

extension Entry: Identifiable { }

extension Entry: Equatable{
    static func == (lhs: Entry, rhs: Entry) -> Bool{
        return lhs.id == rhs.id
            && lhs.createdAt == rhs.createdAt
            && lhs.text == rhs.text
    }
}


