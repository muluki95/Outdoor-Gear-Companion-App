//
//  Gear Management.swift
//  Outdoor Gear Companion App
//
//  Created by Esther Nzomo on 8/13/25.
//


import SwiftUI
import Kingfisher

struct AllInventory: View {
    
    let gear: Gear
    
    var body: some View {
        HStack{
            if let urlString = gear.imageURL,
               let url = URL(string: urlString){
                KFImage(url)
                    .placeholder{
                        ProgressView()
                    }
                
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            } else {
                Image(systemName: "photo")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(10)
                                    .foregroundStyle(.gray)
            }
                
            VStack(alignment:.leading){
                Text(gear.imageName)
                    .font(.headline)
                    .fontWeight(.bold)
                
                Text("\(gear.reviews) reviews • ⭐️ \(gear.rating, specifier: "%.1f")")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                
            }
            .padding()
        }
    }
}
