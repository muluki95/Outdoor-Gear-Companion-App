//
//  LoginViewModel.swift
//  Outdoor Gear Companion App
//
//  Created by Esther Nzomo on 9/18/25.
//

import SwiftUI


class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    
    func login() async throws {
        try await AuthService().login(withEmail: email, password: password)
        
    }
}
