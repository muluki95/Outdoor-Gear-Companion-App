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
        guard let url = Bundle(for: type(of:self)).url(forResource:"inventory", withExtension: "JSON")else {
            XCTFail("Missing file: inventory.json")
            return
        }
    }
}
