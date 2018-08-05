//
//  Identifiable.swift
//  DiaryTest
//
//  Created by Edward WonSangjin on 2018. 8. 5..
//  Copyright © 2018년 Edward WonSangjin. All rights reserved.
//

import Foundation


protocol Identifiable{
    var id: Int{ get }
}

extension Identifiable{
    func isIdentical(to other: Self) -> Bool{
        return id == other.id
    }
}
