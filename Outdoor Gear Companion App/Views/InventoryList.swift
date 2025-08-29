//
//  InventiryList.swift
//  Outdoor Gear Companion App
//
//  Created by Esther Nzomo on 8/19/25.
//

import SwiftUI


struct InventoryList: View {
    let items: [Inventory] = [
        Inventory(id: "1",
                  imageURL: "https://images.unsplash.com/photo-1504280390368-3971a94372e0?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80",
                  imageName: "Camping Backpack",
                  description: "Durable backpack with plenty of storage."),
        Inventory(id: "2",
                  imageURL: "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80",
                  imageName: "Camping Tent",
                  description: "Two-person tent, lightweight and waterproof."),
        Inventory(id: "3",
                  imageURL: "https://images.unsplash.com/photo-1523413651479-597eb2da0ad6?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80",
                  imageName: "Folding Chair",
                  description: "Comfortable and portable chair for outdoor use.")
        
    ]
    var body: some View{
        NavigationStack{
            List(){
                
            }
            .navigationTitle("Inventory")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
#Preview {
    InventoryList()
    
}
