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
    
    // Polucheniw info user dlya otobrojeniya na UI screen view profile
    func fetchUser() {
        //fetch id
        guard let userID = Auth.auth().currentUser?.uid else { return }
        
        //add dataBase for user
        let db = Firestore.firestore()
        
        // poluchit document user
        db.collection("users").document(userID).getDocument { [weak self] snapshot, error in
            //poluchaem danie
            guard let data = snapshot?.data(), error == nil else { return }
            
            //sozdayom user , v main potoke chob obnovlyat ego dlya UI na ekrane
            DispatchQueue.main.async {
                self?.user = User(
                    id: data["id"] as? String ?? "", // v vide data s privideniem string tipa... ili on budet ""
                    name: data["name"] as? String ?? "", // v vide data s privideniem string tipa... ili on budet "",
                    email: data["email"] as? String ?? "", // v vide data s privideniem string tipa... ili on budet "",
                    joinedDate: data["joinedDate"] as? TimeInterval ?? 0 // v vide data s privideniem TimeInterval tipa... ili on budet 0
                )
                
                //etogo dostatochno chtob nayti nachego current user a ,
            }
        }
    }
    
    // log out , vixod iz profilya
    // Errors thrown from here are not handled !! Nam nujno gdeto xranit i obrobativat error
    // v do catch blok zakidivaem
    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error.localizedDescription)
        }
    }
}
