//
//  ContentView.swift
//  Pawfect Guide
//
//  Created by Moladin on 30/10/2025.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(BreedModel.self) var model
    @State var query = ""
    @State var errorMessage = ""  // Track error messages
    @State var hasSearched = false  // Track if user clicked Go
    
    var body: some View {
        
        ZStack{
            //Background Color
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(Color(red: 250/255, green: 245/255, blue: 235/255))
            
            VStack{
                HStack{
                    Text("Pawfect Guide")
                        .font(.system(size: 32, weight: .heavy))
                        .foregroundColor(Color(red: 0.4, green: 0.3, blue: 0.25))
                    Image(systemName: "pawprint.fill")
                        .font(.system(size: 25))
                        .foregroundColor(.orange)
                    Spacer()
                }.padding(.horizontal, 20)
                
                // Search bar
                HStack(spacing: 12) {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 20))
                        .foregroundColor(.gray)
                    
                    TextField("Insert limit from 1-10...", text: $query)
                        .keyboardType(.numberPad)
                        .font(.system(size: 16))
                        .onChange(of: query) { oldValue, newValue in
                            // Clear error when user types
                            if hasSearched {
                                errorMessage = ""
                                hasSearched = false
                            }
                        }
                    
                    Button("Go"){
                        hasSearched = true
                        
                        // Validate if input is a number with Int(query)
                        guard let limit = Int(query) else {
                            errorMessage = "Please enter a valid number"
                            model.breedSearch = []  // Clear results
                            return
                        }
                        // Validate if input is an int between 1-10
                        guard limit >= 1 && limit <= 10 else {
                            errorMessage = "Please enter a number from 1-10"
                            model.breedSearch = []  // Clear results
                            return
                        }
                        
                        // Valid input - clear error and fetch
                        errorMessage = ""
                        model.getBreeds(limit: limit)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(6)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 14)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 2)
                .padding(.horizontal, 20)
                
                // Display logic based on state
                if !errorMessage.isEmpty {
                    VStack {
                        Spacer()
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .font(.system(size: 16))
                        Spacer()
                    }
                }
                //Display loading while fetching data
                else if model.breedSearch.isEmpty && hasSearched {
                    VStack {
                        Spacer()
                        ProgressView()
                            .tint(.orange)
                        Text("Loading breeds...")
                            .foregroundColor(.gray)
                            .padding(.top, 8)
                        Spacer()
                    }
                }
                //Display list of breeds
                else if !model.breedSearch.isEmpty {
                    ScrollView(showsIndicators: false) {
                        LazyVStack(spacing: 16){
                            ForEach(model.breedSearch) { breedSearch in
                                ForEach(breedSearch.breeds) { breed in
                                    ListView(
                                        breedName: breed.name ?? "Unknown",
                                        imageURL: breedSearch.url ?? "",
                                        breedGroup: breed.breedGroup ?? "Mixed",
                                        temperament: breed.temperament ?? "None"
                                    )
                                }
                            }
                        }
                        .padding(.top, 16)
                    }
                }
                //Never searched or empty state
                else {
                    VStack {
                        Spacer()
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 50))
                            .foregroundColor(.orange.opacity(0.5))
                        Text("Search for dog breeds")
                            .foregroundColor(.gray)
                            .font(.system(size: 16))
                            .padding(.top, 8)
                        Spacer()
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
        .environment(BreedModel())
}
