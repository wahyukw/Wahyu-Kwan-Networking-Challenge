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
    
    var body: some View {
        
        ZStack{
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(Color(red: 250/255, green: 245/255, blue: 235/255))
            VStack{
                HStack{
                    Text("Pawfect Guide")
                        .font(.system(size: 32, weight: .heavy))
                        .foregroundColor(Color(red: 0.4, green: 0.3, blue: 0.25))
                    Image(systemName: "pawprint.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.orange)
                    Spacer()
                }.padding(.horizontal, 20)
                
                HStack(spacing: 12) {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.gray)
                    
                    TextField("Insert limit from 0-10...", text: $query)
                        .keyboardType(.numberPad)
                        .font(.system(size: 16))
                    Button("Go"){
                        model.getBreeds(limit: Int(query) ?? 0)
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
                
                ScrollView(showsIndicators: false) {
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
            }
        }
    }
}

#Preview {
    HomeView()
        .environment(BreedModel())
}
