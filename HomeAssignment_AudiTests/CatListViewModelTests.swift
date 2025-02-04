//
//  CatListViewModelTests.swift
//  HomeAssignment_Audi
//
//  Created by Jóse Bustamante on 4/02/25.
//

import XCTest
@testable import HomeAssignment_Audi

final class CatListViewModelTests: XCTestCase {
    var viewModel: CatListViewModel!

    override func setUp() {
        super.setUp()
        viewModel = CatListViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testInitialState() {
        XCTAssertTrue(viewModel.cats.isEmpty, "Cats list should be empty initially")
        XCTAssertTrue(viewModel.favoriteCats.isEmpty, "Favorites list should be empty initially")
    }

    func testAddingFavorite() {
        let cat = Cat(id: "1", name: "Test Cat", temperament: "Calm", origin: "Testland", description: "A test cat", referenceImageID: "testImage")
        
        viewModel.toggleFavorite(cat: cat)
        XCTAssertTrue(viewModel.favoriteCats.contains(where: { $0.id == cat.id }), "Cat should be added to favorites")
    }

    func testRemovingFavorite() {
        let cat = Cat(id: "2", name: "Another Cat", temperament: "Playful", origin: "Testland", description: "Another test cat", referenceImageID: "testImage")

        viewModel.toggleFavorite(cat: cat)
        viewModel.toggleFavorite(cat: cat)
        
        XCTAssertFalse(viewModel.favoriteCats.contains(where: { $0.id == cat.id }), "Cat should be removed from favorites")
    }
}
