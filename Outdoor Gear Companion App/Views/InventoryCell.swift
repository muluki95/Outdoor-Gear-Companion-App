//
//  InventoryCell.swift
//  Outdoor Gear Companion App
//
//  Created by Esther Nzomo on 8/26/25.
//

import SwiftUI

struct InventoryCell: View {
    let item: Inventory
    
    var body: some View {
        
                        HStack {
                            if let urlString = item.imageURL, let url = URL(string: urlString)  {
                                    AsyncImage(url: url) { phase in
                                            switch phase {
                                            case .empty:
                                                ProgressView()
                                                        .progressViewStyle(CircularProgressViewStyle())
                                                        .scaleEffect(0.7)
                                                        .tint(.blue)
                                                        .frame(width: 60, height: 60)
                                            case .success(let image):
                                             image
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(width: 60, height: 60)
                                                        .cornerRadius(10)
                                            case .failure:
                                                    Image(systemName: "photo.fill")
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(width: 60, height: 60)
                                                        .foregroundColor(.gray)
                                                        .cornerRadius(10)
                                        @unknown default:
                                                    EmptyView()
                                                                }
                                                            }
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
                                                    Divider()
                    }
                    
                }
                
           
