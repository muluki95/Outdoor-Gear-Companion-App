//
//  UserService.swift
//  Outdoor Gear Companion App
//
//  Created by Esther Nzomo on 9/19/25.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore


class UserService {
    @Published var currentUser: User?
    
    static let shared = UserService()
    
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
        
    }
    
    
    
}
