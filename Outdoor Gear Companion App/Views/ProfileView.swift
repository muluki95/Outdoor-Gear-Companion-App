import SwiftUI
import PhotosUI
import Kingfisher

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    @StateObject var settingsVM = SettingsViewModel()
    
    @State private var showDeleteAlert = false
    
    private var user: User? {
        return viewModel.currentUser
    }
    
    var body: some View {
        VStack {
            Section {
                PhotosPicker(selection: $viewModel.selectedItem) {
                    ProfileImageView(
                        profileImage: viewModel.profileImage,
                        imageUrl: user?.profileImageUrl
                    )
                }
                
                if let fullname = user?.fullname {
                    Text(fullname)
                        .font(.title2)
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom)
            
            List {
                Section {
                    ForEach(SettingsOptionsViewModel.allCases) { option in
                        switch option {
                        case .darkMode:
                            Toggle(isOn: $settingsVM.isDarkModeEnabled){
                                HStack{
                                    Image(systemName: option.imageName)
                                        .resizable()
                                        .frame(width:24, height: 24)
                                        .foregroundColor(option.imageBackgroundColor)
                                    Text(option.title)
                                        .fontWeight(.semibold)
                                }
                            }
                            .onChange(of: settingsVM.isDarkModeEnabled, initial: false){oldValue, newValue in
                                if let window = UIApplication.shared.connectedScenes
                                    .compactMap ({ $0 as? UIWindowScene})
                                    .first? .windows.first {
                                    window.overrideUserInterfaceStyle = newValue ? .dark : .light
                                }
                            }
                        case .notificationsEnabled:
                            Toggle(isOn: $settingsVM.notificationsEnabled){
                                VStack(alignment: .leading){
                                    HStack{
                                        Image(systemName: option.imageName)
                                            .resizable()
                                            .frame(width: 24, height: 24)
                                            .foregroundColor(option.imageBackgroundColor)
                                        Text(option.title)
                                            .fontWeight(.semibold)
                                    }
                                        Text(settingsVM.notificationsEnabled ? "Active" : "Offline")
                                            .font(.subheadline)
                                            .foregroundColor(settingsVM.notificationsEnabled ? .green : .gray)
                                    
                                }
                            }
                        }
                    }
                }
                
                Section {
                    Button("Log Out") {
                        AuthService.shared.signOut()
                    }
                    .foregroundStyle(.red)
                    
                    Button("Delete Account") {
                        showDeleteAlert = true
                        
                    }
                    .foregroundStyle(.red)
                    .alert("Delete Account", isPresented: $showDeleteAlert){
                        Button("Delete", role: .destructive){
                            Task {
                                await AuthService.shared.deleteAccount()
                            }
                        }
                        Button("Cancel", role: .cancel){}
                        
                    } message: {
                        Text("Are you sure you want to delete your account?")
                        
                    }
                }
            }
        }
    }
}

@MainActor
struct ProfileImageView: View {
    let profileImage: Image?
    let imageUrl: String?
    
    var body: some View {
        if let profileImage = profileImage {
            // Picked photo
            profileImage
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
        } else if let imageUrl = imageUrl, let url = URL(string: imageUrl) {
            // Remote URL with Kingfisher
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
            // Default placeholder
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .foregroundStyle(.gray)
        }
    }
}


#Preview{
    ProfileView()
}
