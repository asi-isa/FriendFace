//
//  User.swift
//  FriendFace
//
//  Created by Ali Soner Inceoglu on 06.12.25.
//

import Foundation

struct User: Codable, Identifiable, Hashable {
    var id: UUID
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    var friends: [Friend]
}

struct Friend: Codable, Identifiable, Hashable {
    var id: UUID
    var name: String
}
