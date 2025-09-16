//
//  ProfileView.swift
//  Outdoor Gear Companion App
//
//  Created by Esther Nzomo on 9/16/25.
//

import SwiftUI


struct ProfileView : View {
    var body: some View {
        VStack {
            Section{
                Image(systemName: "person.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                   
                Text("Esther Nzomo")
                    .font(.title2)
                    .fontWeight(.semibold)
                
            }
            .padding(.bottom)
            List{
                Section{
                    ForEach(SettingsOptionsViewModel.allCases) { option in
                        HStack{
                            Image(systemName: option.imageName)
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(option.imageBackgroundColor)
                            
                            Text(option.title)
                                .fontWeight(.semibold)
                            
                        }
                    }
                }
                Section{
                    Button("Log Out"){
                        
                    }
                    
                    Button("Delete Account"){
                        
                    }
                    
                }
                
            }
        }
    }
}


#Preview {
    ProfileView()
}
