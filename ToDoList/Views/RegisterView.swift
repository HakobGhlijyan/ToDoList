//
//  RegisterView.swift
//  ToDoList
//
//  Created by Hakob Ghlijyan on 10.10.2024.
//

import SwiftUI

struct RegisterView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            //Header
            HeaderView(title: "Register", subTitle: "Start organizing todos", angle: -15, backgroundColor: Color.brown)
            
            //Login Form
            Form {
                TextField("Full Name", text: $name)
                    .textFieldStyle(.plain)
                    .autocorrectionDisabled()
                
                TextField("Email Address", text: $email)
                    .textFieldStyle(.plain)
                    .textInputAutocapitalization(.none)
                    .autocorrectionDisabled()
                
                SecureField("Password", text: $password)
                    .textFieldStyle(.plain)

                TLButtonView(title: "Create Account", backgroundColor: .green) {
                    
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
