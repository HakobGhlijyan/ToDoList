//
//  NewItemViewModel.swift
//  ToDoList
//
//  Created by Hakob Ghlijyan on 10.10.2024.
//

import Foundation

final class NewItemViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var description: String = ""
    @Published var dueDate: Date = Date()
    
    @Published var showAlert: Bool = false
    
    init() {}
    
    func save() {
        
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty && !description.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        
        
        return true
        
    }
}
