//
//  DataService.swift
//  Pawfect Guide
//
//  Created by Moladin on 30/10/2025.
//

import Foundation

struct DataService{
    
    let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    var endpointUrl = "https://api.thedogapi.com/v1/images/search?limit=10&has_breeds=1"
    
    func breedSearch() async -> [BreedSearch] {
        
        guard apiKey != nil else {
            return [BreedSearch]()
        }
        
        if let url = URL(string: endpointUrl) {
            
            var request = URLRequest(url: url)
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue(apiKey ?? "", forHTTPHeaderField: "x-api-key")
            do {
                let (data, res) = try await URLSession.shared.data(for: request)
                let decoder = JSONDecoder()
                let result = try decoder.decode([BreedSearch].self, from: data)
                return result
            } catch {
                print(error)
            }
        }
        
        return [BreedSearch]()
    }
    
}
