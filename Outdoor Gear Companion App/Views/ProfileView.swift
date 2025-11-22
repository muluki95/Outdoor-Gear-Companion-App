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
        NavigationStack {
            List {
                // MARK: - Profile Section
                Section {
                    HStack(spacing: 16) {
                        PhotosPicker(selection: $viewModel.selectedItem) {
                            ProfileImageView(
                                profileImage: viewModel.profileImage,
                                imageUrl: user?.profileImageUrl
                            )
                        }
                        VStack(alignment: .leading) {
                            if let fullname = user?.fullname {
                                Text(fullname)
                                    .font(.title2)
                                    .fontWeight(.semibold)
                            }
                        }
                        Spacer()
                    }
                    .padding(.vertical, 8)
                }

                // MARK: - Settings Section
                Section(header: Text("Settings")) {
                    ForEach(SettingsOptionsViewModel.allCases) { option in
                        switch option {
                        case .darkMode:
                            HStack {
                                Image(systemName: option.imageName)
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(option.imageBackgroundColor)
                                Text(option.title)
                                    .fontWeight(.semibold)
                                Spacer()
                                Toggle("", isOn: $settingsVM.isDarkModeEnabled)
                                    .labelsHidden()
                            }
                        case .notificationsEnabled:
                            HStack {
                                Image(systemName: option.imageName)
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(option.imageBackgroundColor)
                                VStack(alignment: .leading, spacing: 2) {
                                    Text(option.title)
                                        .fontWeight(.semibold)
                                    Text(settingsVM.notificationsEnabled ? "Active" : "Offline")
                                        .font(.subheadline)
                                        .foregroundColor(settingsVM.notificationsEnabled ? .green : .gray)
                                }
                                Spacer()
                                Toggle("", isOn: $settingsVM.notificationsEnabled)
                                    .labelsHidden()
                            }
                        }
                    }
                }

                // MARK: - Actions Section
                Section {
                    Button("Log Out") {
                        AuthService.shared.signOut()
                    }
                    .foregroundColor(.red)

                    Button("Delete Account") {
                        showDeleteAlert = true
                    }
                    .foregroundColor(.red)
                    .alert("Delete Account", isPresented: $showDeleteAlert) {
                        Button("Delete", role: .destructive) {
                            Task {
                                await AuthService.shared.deleteAccount()
                            }
                        }
                        Button("Cancel", role: .cancel) {}
                    } message: {
                        Text("Are you sure you want to delete your account?")
                    }
                }
            }
            .navigationTitle("Profile")
        }
        // Dark mode applied to this view only, no navigation jump
        .preferredColorScheme(settingsVM.isDarkModeEnabled ? .dark : .light)
    }
}

@MainActor
struct ProfileImageView: View {
    let profileImage: Image?
    let imageUrl: String?
    
    var body: some View {
        if let profileImage = profileImage {
            profileImage
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
        } else if let imageUrl = imageUrl, let url = URL(string: imageUrl) {
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
