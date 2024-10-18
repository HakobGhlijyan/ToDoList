//
//  ToDoListItemViewModel.swift
//  ToDoList
//
//  Created by Hakob Ghlijyan on 10.10.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

final class ToDoListItemViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: ToDoListItem) {
        // change item is Done
        var itemChangedIsDone = item
        itemChangedIsDone.setDone(!item.isDone)
        
        //user id
        guard let uId = Auth.auth().currentUser?.uid else { return }
        
        //save new state
        let db = Firestore.firestore()
        
        //set new changed data in firestore
        db
            .collection("users")
            .document(uId)
            .collection("todos")
            .document(itemChangedIsDone.id)
            .setData(itemChangedIsDone.asDictionary())
        
    }
}
