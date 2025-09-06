//
//  Gear.swift
//  Outdoor Gear Companion App
//
//  Created by Esther Nzomo on 9/5/25.
//

import Foundation


struct Gear: Codable, Identifiable {
    var id: String
    let imageURL: String?
    let imageName: String
    let rating: Double
    let reviews: Int
    
}



extension Gear {
    static let mockData: [Gear] = [
        Gear(id: UUID().uuidString,
             imageURL: "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80",
             imageName: "Camping Tent",
             rating: 4.5,
             reviews: 120),
        Gear(id: UUID().uuidString,
             imageURL: "https://images.unsplash.com/photo-1519681393784-d120267933ba?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80",
             imageName: "Hiking Backpack",
             rating: 4.8,
             reviews: 250),
        Gear(id: UUID().uuidString,
             imageURL: "https://images.unsplash.com/photo-1529070538774-1843cb3265df?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80",
             imageName: "Climbing Rope",
             rating: 4.3,
             reviews: 95),
        Gear(id: UUID().uuidString,
             imageURL: "https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80",
             imageName: "Sleeping Bag",
             rating: 4.7,
             reviews: 180),
        Gear(id: UUID().uuidString,
             imageURL: "https://images.unsplash.com/photo-1535905557558-afc4877a26fc?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80",
             imageName: "Portable Stove",
             rating: 4.6,
             reviews: 145)
    ]
}
