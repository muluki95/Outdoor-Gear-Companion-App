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


