//
//  InventoryModel.swift
//  Outdoor Gear Companion App
//
//  Created by Esther Nzomo on 8/13/25.
//
  import Foundation
  import SwiftUI
  import FirebaseFirestore



struct Inventory: Codable, Identifiable {
    @DocumentID var uid: String?
    let imageURL: String?
    let imageName: String
    let description: String
    
    
    var id: String {
        return uid ?? UUID().uuidString
    }
}


