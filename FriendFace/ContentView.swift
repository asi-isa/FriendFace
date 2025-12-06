//
//  ContentView.swift
//  FriendFace
//
//  Created by Ali Soner Inceoglu on 06.12.25.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \User.name) var users: [User]
    
    var body: some View {
        NavigationStack {
            List(users) { user in
                NavigationLink(value: user) {
                    HStack(spacing: 8) {
                        VStack(alignment: .leading) {
                            Text(user.name)
                                .font(.subheadline)
                            Text(user.id.uuidString)
                                .foregroundStyle(.secondary)
                        }
                        
                        Spacer()
                        
                        Text(String(user.friends.count))
                    }
                }
            }
            .navigationDestination(for: User.self, destination: { user in
                UserDetailView(user: user)
            })
            .toolbar {
                Button("Fetch Data", systemImage: "plus") {
                    Task {
                        await fetchData()
                    }
                }
            }
        }
    }
    
    func fetchData() async {
        do {
            let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
            
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            let decoded = try decoder.decode([User].self, from: data)
            
            for user in decoded {
                modelContext.insert(user)
            }
            
        } catch {
            print(error.localizedDescription)
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: User.self)
}
