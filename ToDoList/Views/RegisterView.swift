//
//  RegisterView.swift
//  ToDoList
//
//  Created by Hakob Ghlijyan on 10.10.2024.
//

import SwiftUI

struct RegisterView: View {
    @State private var email: String = ""
    
    var body: some View {
        VStack {
            //Header
            HeaderView(title: "Register", subTitle: "Start organizing todos", angle: -15, background: Color.brown)
            
            //Login Form
            Form {
                TextField("Email Address", text: $email)
                    .textFieldStyle(.plain)
                
                TextField("Email Address", text: $email)
                    .textFieldStyle(.plain)
                
                TextField("Email Address", text: $email)
                    .textFieldStyle(.plain)
                
                TextField("Email Address", text: $email)
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
                .padding()
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
