//
//  LoginView.swift
//  ToDoList
//
//  Created by Hakob Ghlijyan on 10.10.2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel: LoginViewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                //Header
                HeaderView(
                    title: "To Do List",
                    subTitle: "Get things done",
                    angle: 15,
                    backgroundColor: Color.indigo
                )
                
                //Login Form
                Form {
                    //Error
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(.plain)
                        .textInputAutocapitalization(.none)

                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(.plain)

                    TLButtonView(title: "Login", backgroundColor: .blue) {
                        viewModel.login()
                    }
                    
                }
                .offset(y: -50)
            
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
        .preferredColorScheme(.dark)
}

