//
//  NewItemViewModel.swift
//  ToDoList
//
//  Created by Hakob Ghlijyan on 10.10.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

final class NewItemViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var description: String = ""
    @Published var dueDate: Date = Date()
    
    @Published var showAlert: Bool = false
    
    init() {}
    
    func save() {
        //check can save elements
        guard canSave else {
            return
        }
        
        // get current id user
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        // create model
        let newId = UUID().uuidString
        let newItem = ToDoListItem(
            id: newId,
            title: title,
            description: description,
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false
        )
        
        // save model indata base in firebase FirebaseFirestore is users id
        let db = Firestore.firestore()
        
        db
            .collection("users").document(uId)
            .collection("todos").document(newId)
            .setData(newItem.asDictionary())
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
