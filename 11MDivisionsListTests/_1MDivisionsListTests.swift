//
//  _1MDivisionsListTests.swift
//  11MDivisionsListTests
//
//  Created by Andrew Clements on 14/08/2024.
//

import XCTest

@testable import _1MDivisionsList

final class _1MDivisionsListTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCountriesListCount() {
        // Verify the total number of countries in the list
        XCTAssertEqual(countriesList.count, 352, "The countriesList should contain 352 items")
    }
    
    func testCountriesListContainsSpecificCountry() {
        // Check if a specific country is in the list
        XCTAssertTrue(countriesList.values.contains(where: { $0.country == "Ireland" }), "Ireland should be in the list")
    }
    
}
