//
//  SplashBaseTests.swift
//  SplashBaseTests
//
//  Created by Robert Shrestha on 11/23/19.
//  Copyright © 2019 robert. All rights reserved.
//

import XCTest
@testable import SplashBase

class SplashBaseTests: XCTestCase {
    
     var expectation:XCTestExpectation?

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let urlString = "https://splashbase.s3.amazonaws.com/mazwai/large/the_sea_also_rises_FKY.mp4%3F1506949636"
        XCTAssertTrue(urlString.isMp4URL)
    }
    
    func testListing(){
        self.measure {
            // Put the code you want to measure the time of here.
            self.expectation = self.expectation(description: "asynchronous request")
            let listVM = ListViewModel()
            
            listVM.getList(completionHandler: { (result) in
                switch result{
                    
                case .success(let status):
                   XCTAssertTrue(status)
                case .failure(let error):
                    XCTAssertThrowsError(error)
                }
                self.expectation?.fulfill()
            })
            self.waitForExpectations(timeout: 12.0, handler:nil)
            
        }
    }
    func testSearch(){
        self.measure {
            // Put the code you want to measure the time of here.
            self.expectation = self.expectation(description: "asynchronous request")
            let listVM = ListViewModel()
            let query = "laptop"
            listVM.getSearchList(queryString: query, completionHandler: { (result) in
                switch result{
                    
                case .success(let status):
                    XCTAssertTrue(status)
                case .failure(let error):
                    XCTAssertThrowsError(error)
                }
                self.expectation?.fulfill()
            })
            self.waitForExpectations(timeout: 12.0, handler:nil)
            
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
