//
//  Product.swift
//  Outdoor Gear Companion App
//
//  Created by Esther Nzomo on 9/4/25.
//

import Foundation
import FirebaseFirestore


struct Product: Codable, Identifiable, Hashable {
    @DocumentID var uid: String?
       let imageURL: String?
       let imageName: String
       let rating: Double
       let description: String
       let specifications: [String: String]
       
       var id: String {
           return uid ?? UUID().uuidString
       }
    
}


extension Product {
    static let mockProducts: [Product] = [
        Product(//id: UUID().uuidString,
                imageURL: "https://images.unsplash.com/photo-1537905569824-f89f14cceb68?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Y2FtcGluZyUyMHRlbnR8ZW58MHx8MHx8fDA%3D",
                imageName: "Camping Tent",
                rating: 4.5,
                description: "A lightweight, waterproof tent perfect for outdoor adventures.",
                specifications: [
                    "Capacity": "2 people",
                    "Weight": "2.3 kg",
                    "Material": "Polyester"
                ]),
        Product(//id: UUID().uuidString,
                imageURL: "https://images.unsplash.com/photo-1620953749696-38989c40eadb?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aGlraW5nJTIwYmFja3BhY2t8ZW58MHx8MHx8fDA%3D",
                imageName: "Hiking Backpack",
                rating: 4.0,
                description: "Durable backpack with multiple compartments for long hikes.",
                specifications: [
                    "Capacity": "50L",
                    "Weight": "1.2 kg",
                    "Material": "Nylon"
                ]),
        Product(//id: UUID().uuidString,
                    imageURL: "https://images.unsplash.com/photo-1654030056105-95d0ef394186?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8aGVhZGxhbXB8ZW58MHx8MHx8fDA%3D",
                    imageName: "Headlamp",
                    rating: 4.3,
                    description: "Bright LED headlamp with adjustable straps, perfect for night adventures.",
                    specifications: [
                        "Lumens": "350 lm",
                        "Battery Life": "40 hours",
                        "Water Resistance": "IPX4"
                    ]),
        Product(//id: UUID().uuidString,
                    imageURL: "https://images.unsplash.com/photo-1576834976341-53b1b975c6f9?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fHBvcnRhYmxlJTIwd2F0ZXIlMjBmaWx0ZXJ8ZW58MHx8MHx8fDA%3D",
                    imageName: "Portable Water Filter",
                    rating: 4.8,
                    description: "Compact water filter that removes bacteria and protozoa, ideal for hiking and camping.",
                    specifications: [
                        "Filter Capacity": "1000 L",
                        "Weight": "200 g",
                        "Filter Type": "Hollow Fiber Membrane"
                    ]),
    ]
}
