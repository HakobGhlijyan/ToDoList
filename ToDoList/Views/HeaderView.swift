//
//  HeaderView.swift
//  ToDoList
//
//  Created by Hakob Ghlijyan on 12.10.2024.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundStyle(Color.indigo)
                .rotationEffect(.degrees(15))
            
            VStack {
                Text("To Do List")
                    .foregroundStyle(.white)
                    .bold()
                    .font(.system(size: 50))
                Text("Get things done")
                    .foregroundStyle(.white)
                    .font(.system(size: 30))
            }
            .padding(.top, 30)
        }
        .frame(
            width: UIScreen.main.bounds.width * 3,
            height: 300
        )
        .offset(y: -100)
    }
}


#Preview {
    HeaderView()
}
