//
//  SignUpViewModel.swift
//  Outdoor Gear Companion App
//
//  Created by Esther Nzomo on 9/18/25.
//

import SwiftUI


class SignUpViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var fullname = ""
    
    
    
    func createUser() async throws {
        try await AuthService.shared.createUser(withEmail: email, password: password, fullname: fullname)
    }
}
