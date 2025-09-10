//
//  Homepage.swift
//  Outdoor Gear Companion App
//
//  Created by Esther Nzomo on 8/13/25.
//

import SwiftUI


struct Homepage: View {
    
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
           HomeContent()
                .tabItem{
                    VStack{
                        Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                        Text("Home")
                    }
                }
                .tag(0)
            BrowseGear(items: Inventory.mockItems)
                .tabItem{
                    VStack{
                        Image(systemName: "magnifyingglass" )
                            .foregroundColor( selectedTab == 1 ? .blue : .gray)
                        Text("Browse Gear")
                    }
                }
                .tag(1)
            ProductCatalogueList(products: Product.mockProducts)
                .tabItem{
                    VStack{
                        Image(systemName: "square.grid.2x2" )
                            .foregroundColor( selectedTab == 1 ? .blue : .gray)
                        Text("Product Catalogue")
                    }
                }
                .tag(2)
            GearManagementList(gears: Gear.mockData)
                .tabItem{
                    VStack{
                        Image(systemName:selectedTab == 3 ? "hammer.fill" : "hammer")
                        Text(" Inventory")
                    }
                }
                .tag(3)
        }
        
    }
}

#Preview {
    Homepage()
}
