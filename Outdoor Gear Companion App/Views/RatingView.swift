//
//  RatingView.swift
//  Outdoor Gear Companion App
//
//  Created by Esther Nzomo on 9/4/25.
//

import SwiftUI


struct RatingView: View {
    
    let rating: Double
    
    var body: some View {
        HStack{
            ForEach(1...5, id:\.self){index in
                if rating >= Double(index){
                    Image(systemName:"star.fill")
                        .foregroundColor(.yellow)
                } else if rating + 0.5 >= Double(index) {
                    Image(systemName:"star.leadinghalf.filled")
                        .foregroundColor(.yellow)
                    
                } else {
                    Image(systemName:"star")
                        .foregroundColor(.gray)
                }
                
            }
        }
    }
}
