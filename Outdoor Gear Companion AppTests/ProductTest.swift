//
//  ProductTest.swift
//  Outdoor Gear Companion App
//
//  Created by Esther Nzomo on 9/8/25.
//

import XCTest

@testable import Outdoor_Gear_Companion_App


class ProductTest: XCTestCase {
    func testDecodeProductJSON() {
        
        guard let url = Bundle(for: type(of: self)).url(forResource: "product", withExtension: "json") else {
          
            XCTFail("Missing JSON file in test bundle")
            return
                }
        do{
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            
            let product = try decoder.decode([Product].self, from: data)
            guard let productItem = product.first else {
                XCTFail("No inventory items found in JSON")
                return
            }
            print("✅ Found product.json at: \(url)")
            
            XCTAssertEqual(productItem.imageURL, "https://images.unsplash.com/photo-1507525428034-b723cf961d3e")
            XCTAssertEqual(productItem.imageName, "Hiking Backpack")
            XCTAssertEqual(productItem.rating, 4.5)
            XCTAssertEqual(productItem.description, "A lightweight and durable hiking backpack suitable for long treks.")
            XCTAssertEqual(productItem.specifications["Capacity"], "45L")
            XCTAssertEqual(productItem.specifications["Material"], "Nylon")
            XCTAssertEqual(productItem.specifications["Weight"], "1.2kg")
            XCTAssertEqual(productItem.specifications["Color"], "Green")
            
        } catch {
            XCTFail("Failed to decode JSON: \(error.localizedDescription)")
        }
    }
}
