//
//  MainViewModel.swift
//  ToDoList
//
//  Created by Hakob Ghlijyan on 10.10.2024.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

final class MainViewModel: ObservableObject {
    // user id
    @Published var currentUserId: String = ""
    // handler - обработчик изменений
    private var handler : AuthStateDidChangeListenerHandle?
    
    init() {
        // Listener. on change currentUserId add State DidChange, an add weak self is conplition func
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            // if user sign in ...
            // is change UI in Main threads
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
                // change on id my user , else is ""
            }
        }
    }
    
    // check user ... return true is user no nil
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
