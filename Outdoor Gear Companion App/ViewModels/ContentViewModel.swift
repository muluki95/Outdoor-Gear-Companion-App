//
//  ContentViewModel.swift
//  Outdoor Gear Companion App
//
//  Created by Esther Nzomo on 9/19/25.
//

import FirebaseAuth
import Combine


class ContentViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    
    
    private var cancellables = Set<AnyCancellable>()
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        AuthService.shared.$userSession.sink{[weak self] userSessionFromAuthService in
            self?.userSession = userSessionFromAuthService
        }.store(in: &cancellables)
        
    }
}
