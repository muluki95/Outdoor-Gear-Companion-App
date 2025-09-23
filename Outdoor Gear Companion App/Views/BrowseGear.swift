//
//  BrowseGear.swift
//  Outdoor Gear Companion App
//
//  Created by Esther Nzomo on 8/13/25.
//

import SwiftUI
import Kingfisher


struct BrowseGear: View {
    @State var searchText = ""
    @EnvironmentObject var viewModel: InventoryViewModel
    
  
    
    let columns = [GridItem(.flexible()),
                   GridItem(.flexible())
    ]
    
    var filteredItems: [Inventory] {
        if searchText.isEmpty {
            return viewModel.items
        } else {
            return viewModel.items.filter{ $0.imageName.lowercased().contains(searchText.lowercased()) }
        }
    }
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .font(.title2)
                            .foregroundColor(.gray)
                            .padding(10)
                        TextField("Search",text: $searchText)
                            .font(.title3)
                            .padding(.vertical, 20)
                        
                    }
                    
                    .overlay{
                        Capsule()
                            .stroke(lineWidth: 0.5)
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    //the grids
                    LazyVGrid(columns:columns){
                        ForEach(filteredItems){singleItem in
                            VStack(alignment:.leading, spacing: 8){
                                if let urlString = singleItem.imageURL,
                                   let url = URL(string: urlString){
                                    KFImage(url)
                                        .resizable()
                                        .aspectRatio(0.8, contentMode: .fill)
                                        .frame(height: 200)
                                        .clipped()
                                    
                                }
                                
                                Text(singleItem.imageName)
                                    .font(.headline)
                                
                                Text(singleItem.description)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Browse Gear")
            .onAppear {
                Task {
                    await viewModel.fetchInventory()
                }
                
            }
            
        }
    }
}

#Preview {
    BrowseGear()
        .environmentObject(InventoryViewModel())
}
