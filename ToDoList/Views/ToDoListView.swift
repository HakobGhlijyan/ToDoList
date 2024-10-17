//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Hakob Ghlijyan on 10.10.2024.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct ToDoListView: View {
    @StateObject private var viewModel: ToDoListViewModel = ToDoListViewModel()

    // Query for Firestore -> array data
    // array no init , but is one user != two user data. it's unique.
    @FirestoreQuery var items: [ToDoListItem]
        
    init(userId: String) {
        //users/<id>/todos/<entries>
        // this array items init for query and add all data for thii id user
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                List(items) { item in
                    ToDoListItemVIew(item: item)
                        .swipeActions {
                            Button("Delete", role: .destructive) {
                                viewModel.delete(id: item.id)
                            }
                        }
                }
                .listStyle(.plain)
            }
            .navigationTitle("To Do List")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        viewModel.showingNewItemView.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }

                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

#Preview {
    ToDoListView(userId: "IltYasRX0deTTo6KonRZgJtdLD02")
        .preferredColorScheme(.dark)
}
