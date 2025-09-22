//
//  ProfileViewModel.swift
//  Outdoor Gear Companion App
//
//  Created by Esther Nzomo on 9/17/25.
//
import Foundation
import SwiftUI
import PhotosUI
import Combine
import Firebase



class ProfileViewModel: ObservableObject {
    @Published var selectedItem: PhotosPickerItem? {
        didSet { Task { try await loadImage() }}
    }
    
    @Published var profileImage: Image?
    @Published var currentUser: User?
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
        
    }
    private func setupSubscribers() {
        UserService.shared.$currentUser.sink {[weak self] user in
            self?.currentUser = user
            
        }.store(in: &cancellables)
    }
    
    func loadImage() async throws {
        guard let item = selectedItem else { return}
        guard let imageData = try await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: imageData) else {return}
        self.profileImage = Image(uiImage: uiImage)
        
    }
}


