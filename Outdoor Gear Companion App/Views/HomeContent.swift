//
//  HomeContent.swift
//  Outdoor Gear Companion App
//
//  Created by Esther Nzomo on 8/25/25.
//

import SwiftUI

struct HomeContent: View {
    var body: some View {
        NavigationStack{
            VStack{
                Section {
                    
                    NavigationLink(destination: BrowseGear(items:Inventory.mockItems)) {
                        Text("Browse Gear")
                            .padding(10)
                            .font(.headline)
                            .fontWeight(.bold)
                            .frame(width: 300, height: 50)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    Spacer()
                }
                VStack(alignment:.leading){
                    HStack{
                        Text("Your Inventory")
                            .font(.headline)
                        Spacer()
                        Image(systemName: "plus")
                        Text("Add Inventory")
                            .font(.headline)
                    }
                    
                    
                }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                
                Spacer(minLength: 20)
                
                InventoryList()
                
                Spacer()
                
                
            }
            .padding()
            .navigationBarTitle("Outdoor Gear Companion")
     
            
        }
        
        
    }
}



