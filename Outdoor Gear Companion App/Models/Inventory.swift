//
//  InventoryModel.swift
//  Outdoor Gear Companion App
//
//  Created by Esther Nzomo on 8/13/25.
//
  import Foundation



struct Inventory: Codable, Identifiable {
    var id: String
    let imageURL: String
    let imageName: String
    let description: String
}
