//
//  GearTest.swift
//  Outdoor Gear Companion App
//
//  Created by Esther Nzomo on 9/8/25.
//

import XCTest

@testable import Outdoor_Gear_Companion_App


class GearTest: XCTestCase {
    func testGear() {
        //load the json from the test  bundle
      

        guard let url = Bundle(for: type(of: self)).url(forResource: "gear", withExtension: "json") else {
            //print("Bundle path: \(Bundle(for: type(of: self)).bundlePath)")
            XCTFail("Missing JSON file in test bundle")
            return
        }

        
        do{
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            
            
            let gear = try decoder.decode([Gear].self, from: data)
            guard let gearItem = gear.first else {
             
                XCTFail("No gear found in JSON")
                return
            }
                // test the expected values
                XCTAssertEqual(gearItem.imageURL, "https://images.unsplash.com/photo-1507525428034-b723cf961d3e")
                XCTAssertEqual(gearItem.imageName, "Hiking Boots")
                XCTAssertEqual(gearItem.rating, 4.7)
                XCTAssertEqual(gearItem.reviews,128 )
                
                
            
        } catch {
            XCTFail("Failed to decode Gear: \(error.localizedDescription)")
            
        }
    }
}
