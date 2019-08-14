//
//  NewsFeedViewModalTests.swift
//  ThirdAssignmentTests
//
//  Created by Mohit Verma on 29/07/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import XCTest

class NewsApiTests: XCTestCase {
    
    ///var newsapi: NewsApi?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        //newsapi = NewsApi.shared
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        //newsapi = nil
    }
    
    func testGetAllNewsData(){
        let promise = expectation(description: "Waiting for api call for 3 seconds")
        
//        newsapi?.callNewsApi(completed: { (data, error) in
//            XCTAssertNotNil(data)
//            promise.fulfill()
//        })
        
        wait(for: [promise], timeout: 3)
    }
    
}
