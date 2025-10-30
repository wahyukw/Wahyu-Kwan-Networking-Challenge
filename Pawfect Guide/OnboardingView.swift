//
//  OnboardingView.swift
//  Pawfect Guide
//
//  Created by Moladin on 30/10/2025.
//

import SwiftUI

struct OnboardingView: View {
    
    @Environment(BreedModel.self) var model
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(LinearGradient(colors: [Color.orange.opacity(0.3), Color.pink.opacity(0.2)], startPoint: .topLeading, endPoint: .bottomTrailing))
                .ignoresSafeArea()
            VStack{
                HStack(alignment:.top, spacing: 16){
                    Spacer()
                    Button("Skip"){
                        dismiss()
                    }
                    .bold()
                    .foregroundColor(Color(red: 0.4, green: 0.3, blue: 0.25))
                    .opacity(0.7)
                }
                .padding(.top, 16)
                .padding(.trailing, 20)
                ZStack{
                    RoundedRectangle(cornerRadius: 24)
                        .foregroundColor(.white)
                        .shadow(color: Color.black.opacity(0.1), radius: 8, x:0, y: 4)
                    Image("doggo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .frame(width: 225, height: 225)
                .padding(.horizontal, 32)
                
                Text("Meet Your\nPerfect Pup!")
                    .padding(.top, 20)
                    .font(.system(size: 34, weight: .heavy))
                    .foregroundColor(Color(red: 0.4, green: 0.3, blue: 0.25))
                    .lineSpacing(34*0.2)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
               Text("Explore 200+ dog breeds and find\nyour furry match")
                    .foregroundColor(Color(red: 0.4, green: 0.3, blue: 0.25))
                    .font(.system(size: 18, weight:.medium))
                    .multilineTextAlignment(.center)
                    .padding(.top, 12)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                
                VStack(alignment:.leading, spacing: 16){
                    HStack{
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.orange)
                                .frame(width: 50, height: 50)
                            Image(systemName: "dog.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                                .foregroundColor(.white)
                        }
                        Text("Browse all dog breeds with adorable photos")
                            .font(.system(size: 16, weight:.medium))
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                            .foregroundColor(Color(red: 0.4, green: 0.3, blue: 0.25))
                    }
                    HStack{
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.orange)
                                .frame(width: 50, height: 50)
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                                .foregroundColor(.white)
                        }
                        Text("Search by name or filter by group")
                            .font(.system(size: 16, weight:.medium))
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                            .foregroundColor(Color(red: 0.4, green: 0.3, blue: 0.25))
                    }
                    HStack{
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.orange)
                                .frame(width: 50, height: 50)
                            Image(systemName: "heart.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                                .foregroundColor(.white)
                        }
                        Text("Learn about temperament, size, and traits")
                            .font(.system(size: 16, weight:.medium))
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                            .foregroundColor(Color(red: 0.4, green: 0.3, blue: 0.25))
                    }
                    .padding(.bottom, 16)
                    Button("Let's Explore!  🐾"){
                        dismiss()
                    }
                    .font(.system(size: 18, weight: .heavy))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity) // makes the text expand to fill available width
                    .padding(.vertical, 20)      // vertical touch target
                    .background(
                        RoundedRectangle(cornerRadius: 14)
                            .fill(Color.orange)
                    )
                }
                .padding(.top, 10)
                .padding(.horizontal, 50)
                Spacer()
            }
        }
        
    }
}

#Preview {
    OnboardingView()
        .environment(BreedModel())
}
