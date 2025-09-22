//
//  ProfileView.swift
//  Outdoor Gear Companion App
//
//  Created by Esther Nzomo on 9/16/25.
//

import SwiftUI
import PhotosUI
import Kingfisher


struct ProfileView : View {
    @StateObject var viewModel = ProfileViewModel()
    //let user: User
    
    private var user: User?{
        return viewModel.currentUser
    }
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
                    } else if let imageUrl = user?.profileImageUrl,
                              let url = URL(string: imageUrl) {
                            KFImage(url)
                            .placeholder {
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 80, height: 80)
                                    .foregroundStyle(.gray)
                            }
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                    } else {
                        // Fallback placeholder
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .foregroundStyle(.gray)
                    }
                }
                if let fullname = user?.fullname {
                    Text(fullname)
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                }
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
    ProfileView()
}
