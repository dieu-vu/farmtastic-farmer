//
//  DateUtilsTest.swift
//  FarmtasticFarmerTests
//
//  Created by Giang Nguyen on 1.5.2022.
//

//Unit tests for DateUtils struct
import XCTest
@testable import FarmtasticFarmer

class DateUtilsTest: XCTestCase {
    let dateUtils = DateUtils()
    let months: [String] = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]
    
    func testGetCurrentYear() {
        let currentYear = dateUtils.getCurrentYear()
        XCTAssertEqual(currentYear, Calendar.current.component(.year, from: Date()))
        XCTAssertNotEqual(currentYear, 2020)
    }
    
    func testGetCurrentMonthInt() {
        let currentMonthInt = dateUtils.getCurrentMonthInt()
        XCTAssertEqual(currentMonthInt, Calendar.current.component(.month, from: Date()))
    }
    
    func testGetCurrentMonthString() {
        let index = Calendar.current.component(.month, from: Date())
        let currentMonth = dateUtils.getCurrentMonthString()
        XCTAssertEqual(currentMonth, months[index - 1])
    }
    
    func testGetMonthInt() {
        let index = dateUtils.getMonthInt(month: "august")
        XCTAssertEqual(index, 7)
        XCTAssertNotEqual(index, 6)
    }
    
    func testGetMonthIntNoParameter() {
        let index = dateUtils.getMonthInt(month: "")
        XCTAssertNil(index)
    }
}

