//
//  LoginViewModel.swift
//  ToDoList
//
//  Created by Hakob Ghlijyan on 10.10.2024.
//

import Foundation


final class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    init() {}
    
    func login() {
        
    }
    
    func validate() {
        
    }
}
