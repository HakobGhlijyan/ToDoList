//
//  ProfileView.swift
//  ToDoList
//
//  Created by Hakob Ghlijyan on 10.10.2024.
//

import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel: ProfileViewModel = ProfileViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Welcome to ToDoList")
            }
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    ProfileView()
        .preferredColorScheme(.dark)
}
