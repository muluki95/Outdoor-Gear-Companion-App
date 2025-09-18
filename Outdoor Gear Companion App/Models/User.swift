//
//  User.swift
//  Outdoor Gear Companion App
//
//  Created by Esther Nzomo on 9/17/25.
//


import Foundation



struct User: Codable, Identifiable, Hashable {
    var id = UUID().uuidString
    let fullname: String
    let email: String
    var profileImageUrl: String?
}


extension User {
    static let mockUser = User(fullname: "Arielle Marie", email:"arielle@gmail.com", profileImageUrl:"logo")
}
