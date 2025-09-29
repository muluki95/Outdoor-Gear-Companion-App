//
//  Gear.swift
//  Outdoor Gear Companion App
//
//  Created by Esther Nzomo on 9/5/25.
//

import Foundation
import SwiftUI
import FirebaseFirestore


struct Gear: Codable, Identifiable {
  @DocumentID var uid: String?
    let imageURL: String?
    let imageName: String
    let rating: Double
    let reviews: Int
    
    
    var id: String {
        return uid ?? UUID().uuidString
    }
    
}



