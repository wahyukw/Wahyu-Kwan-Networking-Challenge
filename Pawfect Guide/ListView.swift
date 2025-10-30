//
//  ListView.swift
//  Pawfect Guide
//
//  Created by Moladin on 30/10/2025.
//

import SwiftUI

struct ListView: View {
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
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width - 40, height: 300)  // Fixed size
                    .clipped()  // CRITICAL: clips overflow
            } placeholder: {
                ProgressView()
                    .frame(height: 280)
            }
            
            // Gradient overlay
            LinearGradient(
                colors: [Color.black.opacity(0.6), Color.clear],
                startPoint: .bottom,
                endPoint: .center
            )
            .frame(height: 280)
            
            // Content
            VStack(alignment: .leading, spacing: 12) {
                Text(breedName)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
                
                VStack(alignment: .leading, spacing: 8) {
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
                    
                    HStack(spacing: 8) {
                        ForEach(temperament.split(separator: ",").prefix(3), id: \.self) { trait in
                            Text(trait.trimmingCharacters(in: .whitespaces))
                                .font(.system(size: 13))
                                .foregroundColor(Color(red: 0.4, green: 0.3, blue: 0.25))
                        }
                    }
                }
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .leading)  // Full width
                .background(.white)
                .cornerRadius(12)
            }
            .padding(16)
        }
        .frame(height: 280)  // Fixed height only, no width
        .cornerRadius(20)
        .shadow(color: Color.orange.opacity(0.2), radius: 10, x: 0, y: 4)
        .padding(.horizontal, 20)  // Padding outside the card
    }
}

#Preview {
    ListView(breedName: "Placeholder", imageURL: "placeholder", breedGroup: "placeholderGroup", temperament: "placeholderTemperament")
        .environment(BreedModel())
}
