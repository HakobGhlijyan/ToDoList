//
//  ProfileViewModel.swift
//  ToDoList
//
//  Created by Hakob Ghlijyan on 10.10.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

final class ProfileViewModel: ObservableObject {
    init() {}
    
    @Published var user: User? = nil
    
    func fetchUser() {
        //fetch id
        guard let userID = Auth.auth().currentUser?.uid else { return }
        
        //add dataBase for user
        let db = Firestore.firestore()
        
        // poluchit document user
        db.collection("users").document(userID).getDocument { [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else { return }
            
            DispatchQueue.main.async {
                self?.user = User(
                    id: data["id"] as? String ?? "",
                    name: data["name"] as? String ?? "",
                    email: data["email"] as? String ?? "",
                    joinedDate: data["joinedDate"] as? TimeInterval ?? 0
                )
            }
        }
    }
    
    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error.localizedDescription)
        }
    }
}
