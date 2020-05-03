//
//  DetailViewModelTests.swift
//  CountriesTests
//
//  Created by Prasad Patil on 5/3/20.
//  Copyright © 2020 Prasad Patil. All rights reserved.
//

import XCTest
@testable import Countries

class DetailViewModelTests: XCTestCase {
    
    let item : CountriesSet = CountriesSet(name: "British Indian Ocean Territory", callingCodes: ["246"], capital: "Diego Garcia", region: "Africa", subregion: "Eastern Africa", timezones: ["UTC+06:00"], currencies: [["code":"USD", "name":"United States dollar", "symbol":"$"]], languages: [["iso639_1" : "en", "iso639_2" : "eng", "name" : "English", "nativeName" : "English"]])
    let imageString : String = "https://restcountries.eu/data/iot.svg"
    var detailsViewModel : DetailsViewModel?
    override func setUp() {
        detailsViewModel =  DetailsViewModel(set: item)
    }
    
    // To test fetching of location based on the loading of properties in viewModel when passed data in terms of longitude and latitude.
    func testGetLocation() {
        guard let viewModel = detailsViewModel else {
            XCTFail()
            return
        }
        
        XCTAssertNotNil(viewModel.callingCodes)
        XCTAssertNotNil(viewModel.capital)
        XCTAssertNotNil(viewModel.countryName)
        XCTAssertNotNil(viewModel.currencies)
        XCTAssertNotNil(viewModel.languages)
        XCTAssertNotNil(viewModel.region)
        XCTAssertNotNil(viewModel.subRegion)
        XCTAssertNotNil(viewModel.timeZones)
        
        let exp = expectation(description: "Image Loading and retreiving")
        
        DataService().downloadImage(url: imageString, completion: { (image, error) in
            if let _ = error {
                XCTFail()
            } else {
                exp.fulfill()
            }
        })
        waitForExpectations(timeout: 3)
    }
    
}
