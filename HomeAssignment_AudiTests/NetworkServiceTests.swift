//
//  NetworkServiceTests.swift
//  HomeAssignment_Audi
//
//  Created by Jóse Bustamante on 4/02/25.
//

import XCTest
@testable import HomeAssignment_Audi

final class NetworkServiceTests: XCTestCase {
    var mockService: MockNetworkService!

    override func setUp() {
        super.setUp()
        mockService = MockNetworkService()
    }

    override func tearDown() {
        mockService = nil
        super.tearDown()
    }

    func testFetchCatsSuccess() {
        let expectation = XCTestExpectation(description: "Mock fetch cats success")

        mockService.fetchData(from: APIEndpoint.cats.rawValue) { (result: Result<[Cat], Error>) in
            switch result {
            case .success(let cats):
                XCTAssertFalse(cats.isEmpty, "Mock data should return at least one cat")
                XCTAssertEqual(cats.first?.name, "Mock Cat", "First cat should be 'Mock Cat'")
            case .failure:
                XCTFail("Mock request should not fail")
            }
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 2.0)
    }

    func testFetchCatsFailure() {
        let expectation = XCTestExpectation(description: "Mock fetch cats failure")
        mockService.shouldReturnError = true

        mockService.fetchData(from: APIEndpoint.cats.rawValue) { (result: Result<[Cat], Error>) in
            switch result {
            case .success:
                XCTFail("Mock request should have failed")
            case .failure:
                XCTAssertTrue(true, "Error was correctly returned")
            }
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 2.0)
    }
}
