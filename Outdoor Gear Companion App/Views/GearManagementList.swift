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
                if !viewModel.gears.isEmpty {
                    Section(header: Text("Gears")){
                        ForEach(viewModel.gears){ gear in
                            GearManagement(gear: gear)
                        }
                    }
                }
                
                if !viewModel.products.isEmpty {
                    Section(header: Text("Products")){
                        ForEach(viewModel.products) { product in
                            ProductCatalogue(product: product)
                        }
                    }
                }
            }
            .navigationTitle("Gear Management")
            
            }
        }
    }

#Preview{
    GearManagementList()
        .environmentObject(InventoryViewModel())
}
