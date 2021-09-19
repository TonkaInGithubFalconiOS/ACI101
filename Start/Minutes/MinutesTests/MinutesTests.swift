//
//  MinutesTests.swift
//  MinutesTests
//
//  Created by TonkaIn Mac Mini 2014 on 19/09/2021.
//  Copyright © 2021 Microsoft. All rights reserved.
//

import XCTest
@testable import Minutes

class MinutesTests: XCTestCase {
    
    var entryUnderTest: Minutes.Entry!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        entryUnderTest = Minutes.Entry("Title", "Content")
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        entryUnderTest = nil
        super.tearDown()
        
    }
    
    func testSerialization(){
        let serializedData = FileEntryStore.serialize(entryUnderTest)!
        let entry = FileEntryStore.deserialize(serializedData)
        
        XCTAssertEqual(entry?.title, "Title", "Title does not match")
        XCTAssertEqual(entry?.content, "Content", "Content does not match")
    }

}
