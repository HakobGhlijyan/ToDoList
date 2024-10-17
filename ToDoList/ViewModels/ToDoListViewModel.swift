//
//  ToDoListViewModel.swift
//  ToDoList
//
//  Created by Hakob Ghlijyan on 10.10.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

final class ToDoListViewModel: ObservableObject {
    @Published var showingNewItemView: Bool = false
    
    init() {}
    
    func delete(id: String) {
        
    }
}
