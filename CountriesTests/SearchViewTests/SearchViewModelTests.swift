//
//  SearchViewModelTests.swift
//  CountriesTests
//
//  Created by Prasad Patil on 5/3/20.
//  Copyright © 2020 Prasad Patil. All rights reserved.
//

import XCTest
@testable import Countries

class SearchViewModelTests: XCTestCase {
    
    var viewModel : SearchViewModel?
    let searchString1 = "India"
    let searchChangedString1 = "Ind"
    let searchString2 = "U"
    
    override func setUp() {
        viewModel = SearchViewModel(dataService: DataService())
    }
    
    // To Test the netwrk call and properties loaded in the ViewModel after successfull response and data
    func testNetworkCallAndProperties() {
        guard let viewModel = viewModel else {
            XCTFail()
            return
        }
        
        let exp = expectation(description: "ViewModel Loading")
        
        viewModel.networkCall(searchString: searchString1) { (value)  in
            if value {
                exp.fulfill()
            } else {
                XCTFail()
            }
        }
        
        waitForExpectations(timeout: 3)
        
        XCTAssertTrue(viewModel.items?.count == 2)
    }
    
    // To Test the netwrk call with changed string
    func testNetworkCallWithDifferentString() {
        guard let viewModel = viewModel else {
            XCTFail()
            return
        }
        
        let exp = expectation(description: "ViewModel Loading for different string")
        
        viewModel.networkCall(searchString: searchChangedString1) { (value)  in
            if value {
                exp.fulfill()
            } else {
                XCTFail()
            }
        }
        
        waitForExpectations(timeout: 3)
        
        XCTAssertTrue(viewModel.items?.count == 5)
        
    }
    
    // To Test Failure of network call to fetch data due to network absence
    // Turn your wifi/cellular network inorder to pass the test
    func testNetworkCallFail() {
        
        guard let viewModel = viewModel else {
            XCTFail()
            return
        }
        
        let exp = expectation(description: "Network call fails")
        
        viewModel.networkCall(searchString: searchString2) { (value)  in
            if value {
                XCTFail()
            } else {
                exp.fulfill()
            }
        }
        
        waitForExpectations(timeout: 3)
        
    }
    
}
