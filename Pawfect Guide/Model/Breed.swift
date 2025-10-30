//
//  Breed.swift
//  Pawfect Guide
//
//  Created by Moladin on 30/10/2025.
//

import Foundation

struct Breed: Decodable, Identifiable{
    let id: Int
    let weight: Weight?
    let height: Height?
    let name: String?
    let breedGroup: String?
    let lifeSpan: String?
    let temperament: String?
    
    enum CodingKeys: String, CodingKey {
        case weight, height, id, name, temperament
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
