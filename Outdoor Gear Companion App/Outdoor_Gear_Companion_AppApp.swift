//
//  Outdoor_Gear_Companion_AppApp.swift
//  Outdoor Gear Companion App
//
//  Created by Esther Nzomo on 8/13/25.
//

import SwiftUI
import Firebase

@main
struct Outdoor_Gear_Companion_AppApp: App {
    
    
    init(){
        
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
