//
//  Breed.swift
//  Pawfect Guide
//
//  Created by Moladin on 30/10/2025.
//

import Foundation

struct Breed: Decodable, Identifiable{
    let weight: Weight?
    let height: Height?
    let id: Int?
    let name: String?
    let breedGroup: String?
    let lifeSpan: String?
    
    enum CodingKeys: String, CodingKey {
        case weight, height, id, name
        case breedGroup = "breed_group"
        case lifeSpan = "life_span"
    }
}

struct Weight: Decodable{
    let imperial: String?
    let metric: String?
}

struct Height: Decodable{
    let imperial: String?
    let metric: String?
}
