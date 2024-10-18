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
                if let user = viewModel.user {
                    profile(user: user)
                    
                } else {
                    ContentUnavailableView("Loading Profile...", systemImage: "person.crop.circle", description: Text("Please wait while we load your profile."))
                }
                
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder func profile(user: User) -> some View {
        //Avatar
        Image(systemName: "person.circle")
            .resizable()
            .scaledToFit()
            .foregroundStyle(.blue)
            .frame(width: 125, height: 125)
            .padding()
        
        Text("Welcome \(user.name.capitalized)")
        
        //Info: Name , EMail, Member since
        VStack(alignment: .leading) {
            HStack {
                Text("Name: ").bold()
                Text(user.name.capitalized)
            }
            .padding()
            HStack {
                Text("Email: ").bold()
                Text(user.email)
            }
            .padding()
            HStack {
                Text("Memner Since: ").bold()
                Text("\(Date(timeIntervalSince1970: user.joinedDate).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding()
        }
        .padding()
        
        // Sign Out
        TLButtonView(title: "Log Out", backgroundColor: .red) {
            viewModel.logOut()
        }
        .padding()
        .padding(.horizontal, 64)

        Spacer()
    }
}

#Preview {
    ProfileView()
        .preferredColorScheme(.dark)
}
