//
//  DiaryTestTests.swift
//  DiaryTestTests
//
//  Created by Edward WonSangjin on 2018. 8. 5..
//  Copyright © 2018년 Edward WonSangjin. All rights reserved.
//

import XCTest
@testable import DiaryTest

class DiaryTestTests: XCTestCase {
//    var newEntry: Entry!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEditEntryText(){
        let newEntry = Entry(id:0, createdAt: Date(), text:"First diary")
        newEntry.text = "First Test"
        XCTAssertEqual(newEntry.text, "First Test")
    }
    
    func testAddEntryToDiary(){
        let diary = InMemoryDiary()
        let newDiary = Entry(id:0, createdAt:Date(), text:"Diary")
        
        diary.add(newDiary)
        
        let entryInDiary: Entry? = diary.entry(with: 0)
        
        XCTAssertEqual(entryInDiary, .some(newDiary))
        XCTAssertTrue(entryInDiary === newDiary)
        XCTAssertTrue(entryInDiary?.isIdentical(to: newDiary) == true)
    }
    
    func testGetEntryWithId(){
        let oldEntry = Entry(id:1, createdAt:Date(), text:"Diary")
        let diary = InMemoryDiary(entries: [oldEntry])
        
        let entry = diary.entry(with:1)
        
        XCTAssertEqual(entry, .some(oldEntry))
        XCTAssertTrue(entry?.isIdentical(to: oldEntry) == true)
    }
    
    func testUpdateEntry(){
        let oldEntry = Entry(id: 1, createdAt: Date(), text:"Diary")
        let diary = InMemoryDiary(entries: [oldEntry])
        
        oldEntry.text = "Modified Diary"
        diary.update(oldEntry)
        
        let entry = diary.entry(with: 1)
        XCTAssertEqual(entry, .some(oldEntry))
        XCTAssertTrue(entry?.isIdentical(to: oldEntry) == true)
        XCTAssertEqual(entry?.text, .some("Modified Diary"))
    }
    
    func testRemoveEntryToDiary(){
        let newDiary = InMemoryDiary()
        let newEntry = Entry(id: 1, createdAt: Date(), text:"Diary")
        newDiary.add(newEntry)
        
        newDiary.remove(newEntry)
        
        let entry = newDiary.recentEntries(max: 3)
        XCTAssertTrue(entry.count == 0)
        
    }
    
    func test_getRecentEntries(){
        let dayBeforeYesterday = Entry(id: 1, createdAt: Date.distantPast, text: "a couple of days ago")
        let yesterDay = Entry(id: 2, createdAt: Date(), text: "yesterday")
        let today = Entry(id: 3, createdAt: Date.distantFuture, text:"today")
        let diary = InMemoryDiary(entries: [dayBeforeYesterday, yesterDay,today])
        
        let entries = diary.recentEntries(max: 3)
        
        XCTAssertEqual(entries.count, 3)
        XCTAssertEqual(entries, [today, yesterDay, dayBeforeYesterday])
    }
    
    func test_getMoreThanExists(){
        let dayBeforeYesterday = Entry(id: 1, createdAt: Date.distantPast, text: "a couple of days ago")
        let yesterDay = Entry(id: 2, createdAt: Date(), text: "yesterday")
        let today = Entry(id: 3, createdAt: Date.distantFuture, text:"today")
        let diary = InMemoryDiary(entries: [dayBeforeYesterday, yesterDay,today])
        
        let entries = diary.recentEntries(max: 10)
        
        XCTAssertEqual(entries.count, 3)
        XCTAssertEqual(entries, [today, yesterDay, dayBeforeYesterday])
        
    }
    
    func test_checkEntryTypeTest(){
        
    }
    
    
}
