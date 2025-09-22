//
//  AuthService.swift
//  Outdoor Gear Companion App
//
//  Created by Esther Nzomo on 9/18/25.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore


class AuthService {
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    
    init() {
        self.userSession = Auth.auth().currentUser
        loadCurrentUserData()
        print("User session id is \(userSession?.uid)")
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do{
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            loadCurrentUserData()
        } catch {
            print("Failed to login: \(error.localizedDescription)")
        }
        
    }
    
    @MainActor
    func createUser(withEmail email: String, password: String, fullname: String) async throws {
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await self.uploadUserData(email: email, fullname: fullname, id: result.user.uid)
            loadCurrentUserData()
        } catch {
            print("Failed to create a user: \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        do{
            try Auth.auth().signOut()  //signs out on the backend
            self.userSession = nil
            UserService.shared.currentUser = nil
        } catch {
            print("Failed to sign out: \(error.localizedDescription)")
        }
    }
    
    private func uploadUserData(email: String, fullname: String, id: String) async throws {
        let user = User(fullname: fullname, email: email, profileImageUrl: nil)
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("users").document(id).setData(encodedUser)
    }
    
    private func loadCurrentUserData() {
        Task{ try await UserService.shared.fetchCurrentUser() }
        
    }
}
