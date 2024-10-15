//
//  ContentView.swift
//  ToDoList
//
//  Created by Hakob Ghlijyan on 10.10.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel: MainViewModel = MainViewModel()
    
    var body: some View {
        if viewModel.isSignedIn , !viewModel.currentUserId.isEmpty {
            ToDoListView()
        } else {
            LoginView()
        }
         
    }
}

#Preview {
    MainView()
        .preferredColorScheme(.dark)
}
