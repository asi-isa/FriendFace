//
//  UserDetailView.swift
//  FriendFace
//
//  Created by Ali Soner Inceoglu on 06.12.25.
//

import SwiftUI

struct UserDetailView: View {
    var user: User
    
    var body: some View {
        Text(user.name)
    }
}
