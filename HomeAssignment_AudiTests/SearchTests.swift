//
//  SearchTests.swift
//  HomeAssignment_Audi
//
//  Created by Jóse Bustamante on 4/02/25.
//


import XCTest
@testable import HomeAssignment_Audi

final class SearchTests: XCTestCase {
    var viewModel: CatListViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = CatListViewModel()
        viewModel.networkService = MockNetworkService()
        
        let mockCats = [
            Cat(id: "1", name: "Abyssinian", temperament: "Active", origin: "Egypt", description: "Short-haired breed", referenceImageID: "image1"),
            Cat(id: "2", name: "Bengal", temperament: "Playful", origin: "USA", description: "Spotted coat", referenceImageID: "image2"),
            Cat(id: "3", name: "Siamese", temperament: "Vocal", origin: "Thailand", description: "Elegant body", referenceImageID: "image3")
        ]
        
        viewModel.cats = mockCats
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testSearchFilter() {
        viewModel.searchText = "Bengal"
        XCTAssertEqual(viewModel.filteredCats.count, 1, "Should find exactly one match")
        XCTAssertEqual(viewModel.filteredCats.first?.name, "Bengal", "Result should be 'Bengal'")
    }
    
    func testEmptySearchReturnsAll() {
        viewModel.searchText = ""
        XCTAssertEqual(viewModel.filteredCats.count, 3, "Should return all cats when search is empty")
    }
    
    func testNoMatchReturnsEmpty() {
        viewModel.searchText = "Nonexistent"
        XCTAssertEqual(viewModel.filteredCats.count, 0, "Should return an empty list when no match is found")
    }
}
