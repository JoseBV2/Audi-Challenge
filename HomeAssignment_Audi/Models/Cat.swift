//
//  Cat.swift
//  HomeAssignment_Audi
//
//  Created by Jóse Bustamante on 4/02/25.
//

import Foundation

struct Cat: Identifiable, Codable {
    let id: String
    let name: String
    let temperament: String
    let origin: String
    let description: String
    let referenceImageID: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name, temperament, origin, description
        case referenceImageID = "reference_image_id"
    }
    
    var imageURL: String {
        guard let imageID = referenceImageID else { return "placeholderCat" }
        return "https://cdn2.thecatapi.com/images/\(imageID).jpg"
    }
}
