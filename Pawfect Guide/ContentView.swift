//
//  ContentView.swift
//  Pawfect Guide
//
//  Created by Moladin on 30/10/2025.
//

import SwiftUI

struct ContentView: View {
    
    var dataService = DataService()
    @State var breedSearch = [BreedSearch]()
    
    var body: some View {
        VStack {
            ForEach(breedSearch) {item in
                ForEach(item.breeds ?? []){ breed in
                    Text(breed.name ?? "Unknown")
                }
            }
        }
        .onAppear{
            Task{
                breedSearch = await dataService.breedSearch()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
