//
//  ParsingTests.swift
//  YubnubTests
//
//  Created by Levi Gustin on 7/29/23.
//

import XCTest
@testable import Yubnub

final class ParsingTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testOpenPeople() throws {
        let people = TestData.People
        XCTAssertNotNil(people)
    }
}
