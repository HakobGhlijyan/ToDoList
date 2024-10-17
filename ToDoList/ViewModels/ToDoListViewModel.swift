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
    
    private let userId : String
    
    init(userId: String) {       // tak mi v view modele pri init ego budem poluchat id is struct i v nego peredavat .
                                 // a sdes on uje poluchv id budet delete
        self.userId = userId
    }

    //Document       -     opt + cmd + /
    
    /// Delete to do
    /// - Parameter id: Item ID For Delete
    func delete(id: String) {
        let db = Firestore.firestore()
        
        // delete todo is path collection users is document -> collection todos is document -> delete for id...
        db
            .collection("users")
            .document(userId)    // Teper sdez kak path document u user est id i on etot pluchaet iz init v struct
            .collection("todos")
            .document(id)
            .delete()
    }
}
