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
    @StateObject private var viewModel: ToDoListViewModel

    // Query for Firestore -> array data
    @FirestoreQuery var items: [ToDoListItem]
        
    init(userId: String) {
        //users/<id>/todos/<entries>
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewModel(userId: userId))
    }
    
    var body: some View {
         NavigationStack {
             VStack {
                 if items.isEmpty {
                     ContentUnavailableView("To Do List...", systemImage: "list.bullet.clipboard", description: Text("Please start adding \nyour new items to your To Do List."))
                 } else {
                     List(items) { item in
                         ToDoListItemView(item: item)
                             .swipeActions {
                                 Button("Delete", role: .destructive) {
                                     viewModel.delete(id: item.id)
                                 }
                             }
                     }
                     .listStyle(.plain)
                 }
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
