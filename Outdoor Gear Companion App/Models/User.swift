//
//  User.swift
//  Outdoor Gear Companion App
//
//  Created by Esther Nzomo on 9/17/25.
//


import Foundation
import FirebaseFirestore



struct User: Codable, Identifiable, Hashable {
    @DocumentID var uid: String?
    let fullname: String
    let email: String
    var profileImageUrl: String?
    
    
    
    var id: String {
        return uid ?? UUID().uuidString
    }
}


extension User {
    static let mockUser = User(fullname: "Arielle Marie", email:"arielle@gmail.com", profileImageUrl:"logo")
}
