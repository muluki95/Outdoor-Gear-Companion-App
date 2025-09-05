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
    
    let item: [Inventory]
    
    let columns = [GridItem(.flexible()),
                   GridItem(.flexible())
    ]
    var body: some View {
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
                    ForEach(item){singleItem in
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
    }
}

#Preview{
    BrowseGear(item:[
        Inventory (id: "1",
                                
                   imageURL: "https://images.unsplash.com/photo-1622260614153-03223fb72052?q=80&w=1287&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                
                   imageName: "Backpack",
                   description: "Durable hiking backpack."
                  ),
        Inventory(id:"2",
                  imageURL:"https://images.unsplash.com/photo-1546367564-ade1880f8921?q=80&w=2342&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                  imageName:"Hiking Boots",
                  description: "Comfortable hiking boots."
                 ),
        Inventory(id:"3",
                   imageURL: "https://images.unsplash.com/photo-1558477280-1bfed08ea5db?q=80&w=1288&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                   imageName: "Sleeping Bags",
                  description: "Warm sleping bags for cold nights."
                   
                  ),
        Inventory(id:"4",
                   imageURL: "https://images.unsplash.com/photo-1621752169645-98c3aa94f75a?q=80&w=927&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                   imageName: "Climbing Ropes",
                  description: "Climbing ropes for outdoor adventures."
                   
                  ),
        Inventory(id:"5",
                   imageURL: "https://plus.unsplash.com/premium_photo-1675814575467-2b30a115b28e?q=80&w=1286&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                   imageName: "Climbing Helmet",
                  description: "Lightweight helmet to protect your head during climbs."
                   
                  ),
        Inventory(id:"6",
                   imageURL: "https://images.unsplash.com/photo-1522041350204-22285237eeca?q=80&w=2340&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                   imageName: "Camping Stove",
                  description: "Portable camping stove for cooking outdoors."
                   
                  ),
        
        
                      
    ])
}
