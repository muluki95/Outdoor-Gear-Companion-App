//
//  InventiryList.swift
//  Outdoor Gear Companion App
//
//  Created by Esther Nzomo on 8/19/25.
//

import SwiftUI


struct InventoryList: View {
    let items: [Inventory]
    
    var body: some View{
        
        
        List(items){item in
            InventoryRow(item: item)
            
        }
        
    }
}
#Preview {
    InventoryList(items: [
                   Inventory( id: "3F1D8E4F-7F6A-41B2-9B62-9D6F1A2C3E8F",
                        imageURL: "https://firebasestorage.googleapis.com/v0/b/yourapp.appspot.com/o/backpack.jpg?alt=media&token=12345",
                        imageName: "Hiking Backpack",
                        description: "65L waterproof hiking backpack with internal frame."
                    ),
                    Inventory(
                        id: "8A92C44B-59A7-42F0-B5A4-3D72B50C74AD",
                        imageURL: "https://firebasestorage.googleapis.com/v0/b/yourapp.appspot.com/o/tent.jpg?alt=media&token=67890",
                        imageName: "Camping Tent",
                        description: "4-person lightweight tent with rainfly and ventilation windows."
                    ),
    ])
}
