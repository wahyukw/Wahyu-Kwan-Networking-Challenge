//
//  ListView.swift
//  Pawfect Guide
//
//  Created by Moladin on 30/10/2025.
//

import SwiftUI

struct ListView: View {
    // Pass your breed data as parameters
    let breedName: String
    let imageURL: String
    let breedGroup: String
    let temperament: String
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Background image
            AsyncImage(url: URL(string: imageURL)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 250)
                    .clipped()
            } placeholder: {
                ProgressView()
                    .frame(height: 250)
            }
            
            // Gradient overlay for text readability
            LinearGradient(
                colors: [Color.black.opacity(0.6), Color.clear],
                startPoint: .bottom,
                endPoint: .center
            )
            .frame(height: 250)
            
            // Content overlay
            VStack(alignment: .leading, spacing: 12) {
                // Breed name
                Text(breedName)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
                
                // Bottom section with white background
                VStack(alignment: .leading, spacing: 8) {
                    // Breed group and arrow
                    HStack {
                        Text(breedGroup)
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.white)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(.orange)
                            .cornerRadius(16)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                    
                    // Temperament tags
                    HStack(spacing: 8) {
                        ForEach(temperament.split(separator: ",").prefix(3), id: \.self) { trait in
                            Text(trait.trimmingCharacters(in: .whitespaces))
                                .font(.system(size: 13))
                                .foregroundColor(Color(red: 0.4, green: 0.3, blue: 0.25))
                                .lineLimit(1)
                        }
                    }
                }
                .padding(16)
                .background(.white)
                .cornerRadius(12)
            }
            .padding(16)
        }
        .frame(height: 250)
        .cornerRadius(20)
        .shadow(color: Color.orange.opacity(0.2), radius: 10, x: 0, y: 4)
        .padding(.horizontal, 20)
        .padding(.vertical, 8)
    }
}

#Preview {
    ListView(breedName: "Placeholder", imageURL: "placeholder", breedGroup: "placeholderGroup", temperament: "placeholderTemperament")
        .environment(BreedModel())
}
