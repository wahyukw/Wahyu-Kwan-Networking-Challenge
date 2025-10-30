//
//  ViewModel.swift
//  Pawfect Guide
//
//  Created by Moladin on 30/10/2025.
//

import Foundation
import SwiftUI



@Observable
class BreedModel: NSObject{
    
    var dataService = DataService()
    var breedSearch = [BreedSearch]()
    
    func getBreeds (limit: Int) {
        Task{
            breedSearch = await dataService.breedSearch(limit: limit)
        }
    }
}
