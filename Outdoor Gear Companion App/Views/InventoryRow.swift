//
//  InventoryRow.swift
//  Outdoor Gear Companion App
//
//  Created by Esther Nzomo on 8/13/25.
//

import SwiftUI


struct InventoryRow: View {
    
    let item: Inventory
    
    var body: some View {
        VStack {
            HStack(alignment:.top) {
                //Image(systemName: "chair")
                if let urlString = item.imageURL, let url = URL(string: urlString){
                    AsyncImage(url: url){phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle())
                                .scaleEffect(0.7)
                                .tint(.blue)
                            
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .cornerRadius(10)
                        case .failure:
                            Image(systemName: "photo.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .cornerRadius(10)
                            
                        @unknown default:
                            EmptyView()
                        }
                    }
                } 
                
                
                
                VStack(alignment:.leading, spacing: 4){
                    
                    Text(item.imageName )
                            .font(.headline)
                            
                    Text(item.description)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        
                    }
               
                    
                }
            .padding(.vertical)
            }
        
        }
    }

