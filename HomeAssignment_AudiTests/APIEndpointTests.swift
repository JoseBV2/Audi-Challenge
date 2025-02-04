//
//  APIEndpointTests.swift
//  HomeAssignment_Audi
//
//  Created by Jóse Bustamante on 4/02/25.
//


import XCTest
@testable import HomeAssignment_Audi

final class APIEndpointTests: XCTestCase {

    func testBaseEndpoints() {
        XCTAssertEqual(APIEndpoint.cats.rawValue, "https://api.thecatapi.com/v1/breeds", "APIEndpoint.cats URL is incorrect")
        XCTAssertEqual(APIEndpoint.search.rawValue, "https://api.thecatapi.com/v1/images/search?breed_ids=", "APIEndpoint.search URL is incorrect")
    }

    func testPaginatedBreeds() {
        let url = APIEndpoint.paginatedBreeds(page: 2, limit: 10)
        XCTAssertEqual(url, "https://api.thecatapi.com/v1/breeds?page=2&limit=10", "Generated paginated URL is incorrect")
    }
}
