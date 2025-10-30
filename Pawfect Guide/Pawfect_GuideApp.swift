//
//  Pawfect_GuideApp.swift
//  Pawfect Guide
//
//  Created by Moladin on 30/10/2025.
//

import SwiftUI

@main
struct Pawfect_GuideApp: App {
    
    @State var model = BreedModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(model)
        }
    }
}
