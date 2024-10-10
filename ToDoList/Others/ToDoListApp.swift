//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Hakob Ghlijyan on 10.10.2024.
//

import SwiftUI
import FirebaseAuth
import FirebaseCore

@main
struct ToDoListApp: App {
    init() {
        FirebaseApp.configure()
        print("Start App Work Firebase")
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}

