//
//  GearDetailView.swift
//  Outdoor Gear Companion App
//
//  Created by Esther Nzomo on 9/30/25.
//

//
//  BrowseGear.swift
//  Outdoor Gear Companion App
//
//  Created by Esther Nzomo on 8/13/25.
//

import SwiftUI
import Kingfisher


struct GearDetailView: View {
    let gear: Gear
    @State private var isAdded = false
    @EnvironmentObject var viewModel: InventoryViewModel
    @EnvironmentObject var gearViewModel: BrowseGearViewModel
    
    var body: some View {
       
            ScrollView{
                
                VStack(alignment:.leading, spacing: 8){
                                if let urlString = gear.imageURL,
                                   let url = URL(string: urlString){
                                    KFImage(url)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 200, height: 200)
                                        .clipped()
                                        .cornerRadius(10)
                                    
                                }
                                
                                Text(gear.imageName)
                                    .font(.headline)
                                    .lineLimit(1)
                                
                                Text("\(gear.reviews) reviews • ⭐️ \(gear.rating, specifier: "%.1f")")
                                                                    .font(.subheadline)
                                                                    .foregroundColor(.secondary)
                                                                    .lineLimit(1)
                                
                                Button{
                                    viewModel.addGear(gear)
                                    isAdded = true
                                } label: {
                                    Text(isAdded ? "Added ✅" : "Add to inventory")
                                        .font(.caption)
                                        .padding(.vertical, 8)
                                        .padding(.horizontal, 16)
                                        .background(isAdded ? Color.green : Color.blue)
                                        .foregroundStyle(.white)
                                        .cornerRadius(8)
                                }
                                .padding(.top)
                              Spacer()
                                
                            }
                     .padding()
                        }
            .navigationTitle("Gear Details")
            .navigationBarTitleDisplayMode(.inline)
                    }
                }
            
          
            
#Preview {
    NavigationStack{
        BrowseGear()
            .environmentObject(InventoryViewModel())
            .environmentObject(BrowseGearViewModel())
    }
}
