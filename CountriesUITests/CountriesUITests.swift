//
//  CountriesUITests.swift
//  CountriesUITests
//
//  Created by Prasad Patil on 4/29/20.
//  Copyright © 2020 Prasad Patil. All rights reserved.
//

import XCTest
@testable import Countries

class CountriesUITests: XCTestCase {
    override func setUp() {
        continueAfterFailure = false
    }
    
    // To test number of cells populated on the table in SearchView
    func testNoOfCellsSearchview() {
        var countOfCells = 0
        let app = XCUIApplication()
        app.launch()
        app.searchFields.element.tap()
        app.searchFields.element.typeText("India")
        sleep(2)
        app.tap()
        for i in 0...app.tables.cells.count-1 {
            app.tables.cells.element(boundBy: i).tap()
            app.navigationBars.buttons["BACK"].tap()
            countOfCells += 1
        }
        XCTAssertTrue(countOfCells == 2)
        }
    
    // To test labels of cells populated on the table in SearchView
    func testTableCellElementsSearchview() {
        let app = XCUIApplication()
        app.launch()
        app.searchFields.element.tap()
        app.searchFields.element.typeText("India")
        sleep(2)
        app.tap()
        for _ in 0...app.tables.cells.count-1 {
            let countryName = app.tables.cells.staticTexts["countryName"]
            XCTAssertTrue(countryName.exists)
        }
    }

    // To test labels of labels populated in the DetailsView
    func testElementsDetailsview() {
        let app = XCUIApplication()
        app.launch()
        app.searchFields.element.tap()
        app.searchFields.element.typeText("India")
        sleep(2)
        app.tap()
        for i in 0...app.tables.cells.count-1 {
            app.tables.cells.element(boundBy: i).tap()
            let countryNameLabel = app.staticTexts["countryNameLabel"]
            let capitol = app.staticTexts["capitol"]
            let region = app.staticTexts["region"]
            let subRegion = app.staticTexts["subRegion"]
            let callingCode = app.staticTexts["callingCode"]
            let timeZone = app.staticTexts["timeZone"]
            let currencies = app.staticTexts["currencies"]
            let languages = app.staticTexts["languages"]

            XCTAssertTrue(countryNameLabel.exists)
            XCTAssertTrue(capitol.exists)
            XCTAssertTrue(region.exists)
            XCTAssertTrue(subRegion.exists)
            XCTAssertTrue(callingCode.exists)
            XCTAssertTrue(timeZone.exists)
            XCTAssertTrue(currencies.exists)
            XCTAssertTrue(languages.exists)
            app.navigationBars.buttons["BACK"].tap()
        }
    }

    
    
}
