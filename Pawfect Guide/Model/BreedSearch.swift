//
//  BreedSearch.swift
//  Pawfect Guide
//
//  Created by Moladin on 30/10/2025.
//

import Foundation

struct BreedSearch: Decodable, Identifiable{
    let id: String
    let url: String?
    let width: Int?
    let height: Int?
    let breeds: [Breed]?
}
