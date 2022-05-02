//
//  UtilsTest.swift
//  FarmtasticFarmerTests
//
//  Created by Giang Nguyen on 1.5.2022.
//

//Unit tests for Utils class
import XCTest
@testable import FarmtasticFarmer

//Unit test for Translation struct
class UtilsTest: XCTestCase {
    let util = Utils.utils
    let formatter = ISO8601DateFormatter()
    let ISO8601DateString = "2022-04-30T08:24:16Z"
    let dateString = "30-04-2022"
    
    func testPreProcessJson() {
        let expected = util.preProcessJson("\\\"{}\"".data(using: .utf8)!)
        
        XCTAssertEqual(expected, "{}".data(using: .utf8))
    }
    
    func testConvertDateFromApi() {
        let date = util.convertDateFromApi(ISO8601DateString)
        
        XCTAssertEqual(date, formatter.date(from: ISO8601DateString))
    }
    
    func testConvertDateFromApiNoParameter() {
        let date = util.convertDateFromApi("")
        let currentDateTime = Date()
        XCTAssertEqual(date, currentDateTime)
    }
    
    func testConvertDateToISOString() {
        let dateObj = formatter.date(from: ISO8601DateString)
        
        if let dateObj = dateObj {
            let convertedDate = util.convertDateToISOString(dateObj)
            XCTAssertEqual(convertedDate, ISO8601DateString)
        } else {
            let currentDateTime = Date()
            let convertedDate = util.convertDateToISOString(currentDateTime)
            XCTAssertEqual(convertedDate, formatter.string(from: currentDateTime))
        }
    }
    
    func testFormatDateString() {
        let dateObj = formatter.date(from: ISO8601DateString)
        
        if let dateObj = dateObj {
            let convertedDateString = util.formatDateString(dateObj)
            XCTAssertEqual(convertedDateString, dateString)
        }
    }
    
    func testGetDateComponents() {
        let dateObj = formatter.date(from: ISO8601DateString)
        
        if let dateObj = dateObj {
            let dateStringComponents = Calendar.current.dateComponents([.year, .month, .day], from: dateObj)
            let dateComponents = util.getDateComponents(dateObj)
            XCTAssertEqual(dateComponents, dateStringComponents)
        }
    }
}



