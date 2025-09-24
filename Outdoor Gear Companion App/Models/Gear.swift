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



