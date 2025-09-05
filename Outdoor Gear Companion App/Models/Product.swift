//
//  Product.swift
//  Outdoor Gear Companion App
//
//  Created by Esther Nzomo on 9/4/25.
//

import Foundation


struct Product: Codable, Identifiable, Hashable {
    var id: String
    let imageURL: String?
    let imageName: String
    let rating: Double
    let description: String
    let specifications: [String: String]
    
    
}


extension Product {
    static let mockProducts: [Product] = [
        Product(id: UUID().uuidString,
                imageURL: "https://images.unsplash.com/photo-1606813907291-c6f3bdb02a21",
                imageName: "Camping Tent",
                rating: 4.5,
                description: "A lightweight, waterproof tent perfect for outdoor adventures.",
                specifications: [
                    "Capacity": "2 people",
                    "Weight": "2.3 kg",
                    "Material": "Polyester"
                ]),
        Product(id: UUID().uuidString,
                imageURL: "https://images.unsplash.com/photo-1523413651479-597eb2da0ad6",
                imageName: "Hiking Backpack",
                rating: 4.0,
                description: "Durable backpack with multiple compartments for long hikes.",
                specifications: [
                    "Capacity": "50L",
                    "Weight": "1.2 kg",
                    "Material": "Nylon"
                ])
    ]
}
