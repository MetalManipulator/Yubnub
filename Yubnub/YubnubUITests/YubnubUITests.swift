//
//  YubnubUITests.swift
//  YubnubUITests
//
//  Created by Levi Gustin on 7/25/23.
//

import XCTest

final class YubnubUITests: XCTestCase {
    let app = XCUIApplication()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your
        // tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testListView() throws {
        // Main view is presented on open
        let navTitle = app.staticTexts["SWAPI People"]
        XCTAssert(navTitle.exists)

        // List view is populated
        let firstRow = app.buttons["Luke Skywalker, 172 cm, 77 kg"]
        XCTAssert(firstRow.waitForExistence(timeout: 5.0))

        // Navigate to Detail view
        firstRow.tap()
        let detailsTitle = app.staticTexts["Luke Skywalker"]
        XCTAssert(detailsTitle.waitForExistence(timeout: 0.5))

        // Navigate back to List view
        let backButton = app.navigationBars.buttons.element(boundBy: 0)
        backButton.tap()
        XCTAssert(navTitle.waitForExistence(timeout: 0.5))
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
