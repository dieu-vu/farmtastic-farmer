//
//  TranslationTest.swift
//  FarmtasticFarmerTests
//
//  Created by Giang Nguyen on 1.5.2022.
//

import XCTest
import SwiftUI
@testable import FarmtasticFarmer

//Unit test for Translation struct
class TranslationTest: XCTestCase {
    let translator = Translation()
    
    @AppStorage("language")
    private var language = LocalizationService.shared.language
    
    func testRandomLocalization() {
        let meat = translator.Meat
        
        switch language {
        case .en:
            XCTAssertEqual(meat, "Meat")
        case .fi:
            XCTAssertEqual(meat, "Liha")
        case .vi:
            XCTAssertEqual(meat, "Thịt")
        }
    }
    
    func testTranslateLanguage() {
        let english = translator.translateLanguage(lang: "english")
        
        switch language {
        case .en:
            XCTAssertEqual(english, "English")
        case .fi:
            XCTAssertEqual(english, "Englanti")
        case .vi:
            XCTAssertEqual(english, "Tiếng Anh")
        }
    }
    
    func testTranslateLanguageNoParameter() {
        let english = translator.translateLanguage(lang: "")
        
        switch language {
        case .en:
            XCTAssertEqual(english, "English")
        case .fi:
            XCTAssertEqual(english, "Englanti")
        case .vi:
            XCTAssertEqual(english, "Tiếng Anh")
        }
    }
    
    
    func testTranslateMonth() {
        let december = translator.translateMonth(month: "december")
        
        switch language {
        case .en:
            XCTAssertEqual(december, "December")
        case .fi:
            XCTAssertEqual(december, "joulukuu")
        case .vi:
            XCTAssertEqual(december, "Tháng 12")
        }
    }
    
    func testTranslateMonthNoParameter() {
        let december = translator.translateMonth(month: "")
        
        switch language {
        case .en:
            XCTAssertEqual(december, "")
        case .fi:
            XCTAssertEqual(december, "")
        case .vi:
            XCTAssertEqual(december, "")
        }
    }
}


