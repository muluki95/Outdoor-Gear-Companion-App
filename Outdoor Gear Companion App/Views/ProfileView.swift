//
//  ProfileView.swift
//  Outdoor Gear Companion App
//
//  Created by Esther Nzomo on 9/16/25.
//

import SwiftUI
import PhotosUI


struct ProfileView : View {
    @StateObject var viewModel = ProfileViewModel()
    let user: User
    
    var body: some View {
        VStack {
            Section{
                PhotosPicker(selection: $viewModel.selectedItem){
                    if let profileImage = viewModel.profileImage {
                        profileImage
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                    } else {
                        Image(user.profileImageUrl ?? "")
                            .resizable()
                            .frame(width: 80, height:80)
                            .foregroundStyle(.gray)
                            .clipShape(Circle())
                    }
                }
                   
                Text(user.fullname)
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
                        AuthService.shared.signOut()
                    }
                    .foregroundStyle(.red)
                    
                    Button("Delete Account"){
                        
                    }
                    .foregroundStyle(.red)
                    
                }
                
            }
        }
    }
}


#Preview {
    ProfileView(user: User.mockUser)
}
