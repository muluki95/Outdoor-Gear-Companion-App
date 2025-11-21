//
//  SettingsViewModel.swift
//  Outdoor Gear Companion App
//
//  Created by Esther Nzomo on 9/16/25.
//

import SwiftUI




enum SettingsOptionsViewModel: Int, CaseIterable, Identifiable {
    case darkMode
    case activeStatus
    
    
    
    var title: String {
        switch self {
        case .darkMode: return "Dark Mode"
        case .activeStatus: return "Active Status"
        
        }
    }
    var imageName: String {
        switch self {
        case .darkMode: return "moon.circle.fill"
        case .activeStatus: return "message.badge.circle.fill"
        
        }
    }
    var imageBackgroundColor: Color {
        switch self {
        case .darkMode: return .black
        case .activeStatus: return Color.green
        }
    }
    
    var id: Int { return self.rawValue}
}


