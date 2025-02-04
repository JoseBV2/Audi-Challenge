//
//  MockNetworkService.swift
//  HomeAssignment_Audi
//
//  Created by Jóse Bustamante on 4/02/25.
//

import Foundation
@testable import HomeAssignment_Audi

class MockNetworkService: NetworkServiceProtocol {
    var shouldReturnError = false

    func fetchData<T: Decodable>(from url: String, completion: @escaping (Result<T, Error>) -> Void) {
        if shouldReturnError {
            completion(.failure(NSError(domain: "MockError", code: 400, userInfo: nil)))
        } else {
            let mockData = """
            [
                {
                    "id": "1",
                    "name": "Mock Cat",
                    "temperament": "Playful",
                    "origin": "Mockland",
                    "description": "A lovely mock cat",
                    "reference_image_id": "mockImage"
                }
            ]
            """.data(using: .utf8)!

            do {
                let decodedData = try JSONDecoder().decode(T.self, from: mockData)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }
    }
}
