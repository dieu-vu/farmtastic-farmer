//
//  FarmtasticFarmerUITests.swift
//  FarmtasticFarmerUITests
//
//  Created by Dieu Vu on 4/3/22.
//  Simple UI test

import XCTest
//@testable import FarmtasticFarmer

class FarmtasticFarmerUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        try super.setUpWithError()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app = nil
    }

    func testTabBarAvailable() throws {
        let tabBar = app.tabBars["Tab Bar"]
        if tabBar.exists {
            let profileTab = app.tabBars["Tab Bar"].buttons["Profile"]
            let productTab = app.tabBars["Tab Bar"].buttons["Product"]
            let statsTab = app.tabBars["Tab Bar"].buttons["Statistics"]

            XCTAssertTrue(profileTab.exists)
            XCTAssertTrue(productTab.exists)
            XCTAssertTrue(statsTab.exists)
        } else {
//            let loginButton = app.buttons[Translation().Login]
//            XCTAssertTrue(loginButton.exists)
        }
        
        // UI tests must launch the application that they test.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
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
