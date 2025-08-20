//
//  InventoryTest.swift
//  Outdoor Gear Companion App
//
//  Created by Esther Nzomo on 8/18/25.
//

import XCTest

@testable import Outdoor_Gear_Companion_App


class InventoryTest: XCTestCase {
    func testDecodeInventoryJSON() {
        guard let url = Bundle(for: type(of:self)).url(forResource:"inventory", withExtension: "json")else {
            XCTFail("Missing file: inventory.json")
            return
        }
        do{
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            
            let inventory = try decoder.decode([Inventory].self, from: data)
            guard let inventoryItem = inventory.first else {
                XCTFail("No inventory items found in JSON")
                return
            }
            
            XCTAssertEqual(inventoryItem.imageURL, "https://firebasestorage.googleapis.com/v0/b/yourapp.appspot.com/o/backpack.jpg?alt=media&token=12345")
            XCTAssertEqual(inventoryItem.imageName, "Hiking Backpack")
            XCTAssertEqual(inventoryItem.description, "65L waterproof hiking backpack with internal frame.")
        } catch {
            XCTFail("Failed to decode JSON: \(error.localizedDescription)")
        }
    }
}
