//
//  ContentView.swift
//  Pawfect Guide
//
//  Created by Moladin on 30/10/2025.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(BreedModel.self) var model
    
    var body: some View {
        @Bindable var model = model
        
        VStack {
            ForEach(model.breedSearch) {item in
                ForEach(item.breeds ?? []){ breed in
                    Text(breed.name ?? "Unknown")
                }
            }
        }
        .task{
            model.getBreeds()
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environment(BreedModel())
}
