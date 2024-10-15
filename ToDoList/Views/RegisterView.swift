//
//  RegisterView.swift
//  ToDoList
//
//  Created by Hakob Ghlijyan on 10.10.2024.
//

import SwiftUI

struct RegisterView: View {
    @StateObject private var viewModel: RegisterViewModel = RegisterViewModel()
    
    var body: some View {
        VStack {
            //Header
            HeaderView(title: "Register", subTitle: "Start organizing todos", angle: -15, backgroundColor: Color.brown)
            
            //Login Form
            Form {
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(.plain)
                    .autocorrectionDisabled()
                
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(.plain)
                    .textInputAutocapitalization(.none)
                    .autocorrectionDisabled()
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(.plain)

                TLButtonView(title: "Create Account", backgroundColor: .green) {
                    viewModel.register()
                }
            }
            .offset(y: -50)
            
            Spacer()
            
        }
    }
}

#Preview {
    RegisterView()
        .preferredColorScheme(.dark)

}
