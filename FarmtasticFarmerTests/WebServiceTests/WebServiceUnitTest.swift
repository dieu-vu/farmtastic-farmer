//
//  WebServiceTest.swift
//  FarmtasticFarmerTests
//
//  Created by Dieu Vu on 5/1/22.
//  Simple Unit test for WebService class

import XCTest
import os
@testable import FarmtasticFarmer


class WebServiceUnitTest: XCTestCase {
    
    let logger = Logger(subsystem: "Farmtastic", category: "WebService")
    
    var webService: WebService!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        webService = WebService()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        webService = nil
    }
    
    
    func testGetCurrentLoggedInUserInfo () {
        let testUsername = "farmtastic_test"
        let testPassword = "12345"
        var expectedResult: User = User.initData
        webService.login(username: testUsername, password: testPassword) { result in
            switch result {
            case .success:
                self.logger.log("Logged in")
            case .failure(let error):
                self.logger.log("reAuthentication failed: \(error.localizedDescription)")
            }
        }
        
        webService.getUser(){ result in
            switch result {
            case .failure(let error):
                print("FAILURE \(error)")
            case .success(let user):
                DispatchQueue.main.sync {
                    expectedResult = user
                    print("EXPECTED RESULT", expectedResult)
                    XCTAssertEqual(expectedResult.username, testUsername, "Webservice User get info is wrong")
                }
            }
        }
        
    }
    
}
