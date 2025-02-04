//
//  CatExplorerUITests.swift
//  HomeAssignment_Audi
//
//  Created by Jóse Bustamante on 4/02/25.
//


import XCTest

final class CatExplorerUITests: XCTestCase {

    let app = XCUIApplication()

    override func setUp() {
        continueAfterFailure = false
        app.launch()
    }

    func testNavigationToDetails() {
        let firstCell = app.scrollViews.children(matching: .other).element(boundBy: 0)
        
        if firstCell.exists {
            firstCell.tap()
            XCTAssertTrue(app.images.element.exists, "Navigation to details screen failed")
        } else {
            XCTFail("First cell not found")
        }
    }

    func testFavoriteFeature() {
        let firstCell = app.scrollViews.children(matching: .other).element(boundBy: 0)
        
        XCTAssertTrue(firstCell.waitForExistence(timeout: 5), "First cell did not appear in time")

        firstCell.swipeUp()
        
        let favoriteButton = firstCell.buttons["favoriteButton"]
        
        XCTAssertTrue(favoriteButton.waitForExistence(timeout: 2), "Favorite button not found")
        
        app.tabBars.buttons["Favorites"].tap()
        
        let favoritesTitle = app.staticTexts["No favorites yet!"]
        XCTAssertFalse(favoritesTitle.waitForExistence(timeout: 3), "Navigation to favorites failed")
    }
}
