//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Hakob Ghlijyan on 10.10.2024.
//

import SwiftUI

struct ToDoListView: View {
    @StateObject private var viewModel: ToDoListViewModel = ToDoListViewModel()
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Welcome to ToDoList")
            }
            .navigationTitle("To Do List")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "plus")
                    }

                }
            }
        }
    }
}

#Preview {
    ToDoListView(userId: "")
        .preferredColorScheme(.dark)
}
