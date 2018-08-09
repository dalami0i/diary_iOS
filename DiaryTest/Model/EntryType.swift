//
//  EntryType.swift
//  DiaryTest
//
//  Created by Edward WonSangjin on 2018. 8. 5..
//  Copyright © 2018년 Edward WonSangjin. All rights reserved.
//

import Foundation


protocol EntryType {
    var id: Int{ set get }
    var createdAt: Date{ set get }
    var text: String { set get }
}





