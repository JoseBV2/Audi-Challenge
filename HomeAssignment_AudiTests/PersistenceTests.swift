//
//  PersistenceTests.swift
//  HomeAssignment_Audi
//
//  Created by Jóse Bustamante on 4/02/25.
//


import XCTest
@testable import HomeAssignment_Audi

final class PersistenceTests: XCTestCase {
    var viewModel: CatListViewModel!

    override func setUp() {
        super.setUp()
        viewModel = CatListViewModel()
        UserDefaults.standard.removeObject(forKey: "favorites") // Limpiar antes de cada prueba
    }

    override func tearDown() {
        UserDefaults.standard.removeObject(forKey: "favorites") // Limpiar después de cada prueba
        viewModel = nil
        super.tearDown()
    }

    func testSavingFavorites() {
        let cat = Cat(id: "123", name: "Test Cat", temperament: "Friendly", origin: "Testland", description: "Mock cat", referenceImageID: "testImage")

        viewModel.toggleFavorite(cat: cat)
        
        // Recargamos desde UserDefaults
        let retrievedData = UserDefaults.standard.data(forKey: "favorites")
        XCTAssertNotNil(retrievedData, "Favorites should be saved in UserDefaults")

        if let decoded = try? JSONDecoder().decode([Cat].self, from: retrievedData!) {
            XCTAssertEqual(decoded.count, 1, "There should be 1 favorite saved")
            XCTAssertEqual(decoded.first?.id, "123", "Saved favorite ID should match")
        } else {
            XCTFail("Failed to decode favorites from UserDefaults")
        }
    }

    func testRemovingFavorites() {
        let cat = Cat(id: "456", name: "Test Cat 2", temperament: "Calm", origin: "Testland", description: "Mock cat", referenceImageID: "testImage")
        
        viewModel.toggleFavorite(cat: cat) // Agregar
        viewModel.toggleFavorite(cat: cat) // Eliminar
        
        let retrievedData = UserDefaults.standard.data(forKey: "favorites")
        XCTAssertNotNil(retrievedData, "Favorites should be saved in UserDefaults")

        if let decoded = try? JSONDecoder().decode([Cat].self, from: retrievedData!) {
            XCTAssertEqual(decoded.count, 0, "There should be no favorites after removal")
        } else {
            XCTFail("Failed to decode favorites from UserDefaults")
        }
    }
}
