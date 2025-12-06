//
//  FriendFaceApp.swift
//  FriendFace
//
//  Created by Ali Soner Inceoglu on 06.12.25.
//

import SwiftUI
import SwiftData

@main
struct FriendFaceApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
