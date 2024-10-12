//
//  LoginView.swift
//  ToDoList
//
//  Created by Hakob Ghlijyan on 10.10.2024.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                //Header
                HeaderView()
                
                //Login Form
                Form {
                    TextField("Email Address", text: $email)
                        .textFieldStyle(.plain)
                    SecureField("Password", text: $password)
                        .textFieldStyle(.plain)

                    Button {
                    //log in
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(.blue)
                            
                            Text("Login")
                                .foregroundStyle(.white)
                                .bold()
                        }
                    }
                }
                
                //Create New Account
                VStack {
                    Text("New around here?")
                    NavigationLink("Create New Account") {
                        RegisterView()
                    }
                }
                .padding(50)
                
                
                Spacer()
            }
         }
    }
}

#Preview {
    LoginView()
}

