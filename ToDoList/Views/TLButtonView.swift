//
//  TLButtonView.swift
//  ToDoList
//
//  Created by Hakob Ghlijyan on 14.10.2024.
//

import SwiftUI

struct TLButtonView: View {
    let title: String
    let backgroundColor: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.blue)
                
                Text(title)
                    .foregroundStyle(.white)
                    .bold()
            }
            .frame(height: 40)
        }
        
    }
}

#Preview {
    TLButtonView(title: "Register", backgroundColor: .blue) {
        //action
        print("Action")
    }
}
