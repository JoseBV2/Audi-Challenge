//
//  APIEndpoint.swift
//  HomeAssignment_Audi
//
//  Created by Jóse Bustamante on 4/02/25.
//

enum APIEndpoint: String {
    case cats = "https://api.thecatapi.com/v1/breeds"
    case search = "https://api.thecatapi.com/v1/images/search?breed_ids="
    
    static func paginatedBreeds(page: Int, limit: Int) -> String {
        return "https://api.thecatapi.com/v1/breeds?page=\(page)&limit=\(limit)"
    }
}
