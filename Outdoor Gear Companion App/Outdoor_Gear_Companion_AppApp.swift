//
//  Outdoor_Gear_Companion_AppApp.swift
//  Outdoor Gear Companion App
//
//  Created by Esther Nzomo on 8/13/25.
//

import SwiftUI
import FirebaseCore




class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        return true
    }
    }

@main
struct Outdoor_Gear_Companion_AppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}
