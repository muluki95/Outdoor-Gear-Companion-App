//
//  GearManagementList.swift
//  Outdoor Gear Companion App
//
//  Created by Esther Nzomo on 9/6/25.
//

import SwiftUI


struct GearManagementList: View {
   
    
    @EnvironmentObject var viewModel: InventoryViewModel
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(viewModel.items){ item in
                GearManagement(item: item)
                    
                }
            }
            .navigationTitle("Gear Management")
            .onAppear {
                Task {
                    await viewModel.fetchInventory()
                }
            }
        }
    }
}
#Preview{
    GearManagementList()
        .environmentObject(InventoryViewModel())
}
