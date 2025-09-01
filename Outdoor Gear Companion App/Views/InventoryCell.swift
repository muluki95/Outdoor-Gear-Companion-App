//
//  InventoryCell.swift
//  Outdoor Gear Companion App
//
//  Created by Esther Nzomo on 8/26/25.
//

import SwiftUI
import Kingfisher

struct InventoryCell: View {
    let item: Inventory
    
    var body: some View {
        
                        HStack {
                            if let urlString = item.imageURL,
                               let url = URL(string: urlString){
                                KFImage(url)
                                    .placeholder{
                                        ProgressView()
                                    }
                                
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 60, height: 60)
                                    .cornerRadius(10)
                            } else {
                                Image(systemName: "photo")
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(width: 60, height: 60)
                                                    .cornerRadius(10)
                                                    .foregroundStyle(.gray)
                            }
                                VStack(alignment: .leading, spacing: 5) {
                                                Text(item.imageName)
                                                    .font(.headline)
                                                Text(item.description)
                                                    .font(.subheadline)
                                                    .foregroundStyle(.secondary)
                                                        }

                                                        Spacer()
                                                    }
                                                  
                    }
                    
                }
                
           
