//
//  GearManagementList.swift
//  Outdoor Gear Companion App
//
//  Created by Esther Nzomo on 9/6/25.
//

import SwiftUI


struct GearManagementList: View {
   
    let gears:[Gear]
    
    var body: some View {
        NavigationStack{
            List {
              ForEach(gears){ gear in
                GearManagement(gear: gear)
                    
                }
            }
            .navigationTitle("Gear Management")
            
        }
    }
}
#Preview{
    GearManagementList(gears: Gear.mockData)
}
