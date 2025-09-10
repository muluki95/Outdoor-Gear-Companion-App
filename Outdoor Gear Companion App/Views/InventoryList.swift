//
//  InventiryList.swift
//  Outdoor Gear Companion App
//
//  Created by Esther Nzomo on 8/19/25.
//

import SwiftUI


struct InventoryList: View {
    let items: [Inventory] = [
        Inventory(
                    id: "1",
                    imageURL: "https://images.unsplash.com/photo-1622260614153-03223fb72052?q=80&w=1287&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    imageName: "Backpack",
                    description: "Durable hiking backpack"
                ),
                Inventory(
                    id: "2",
                    imageURL: "https://images.unsplash.com/photo-1617939354787-6569df46c0a2?q=80&w=2328&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    imageName: "Tent",
                    description: "2-person lightweight camping tent"
                ),
                Inventory(
                    id: "3",
                    imageURL: "https://images.unsplash.com/photo-1698918160380-2857bbc02bfc?q=80&w=2340&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    imageName: "Folding Chair",
                    description: "Portable camping chair"
                )
            ]

    var body: some View{
        NavigationStack{
            List(items){item in
                InventoryCell(item: item)
                
            }
            .navigationTitle("Inventory")
            
        }
    }
}
#Preview {
    InventoryList()
    
}
