//
//  HeaderView.swift
//  ToDoList
//
//  Created by Hakob Ghlijyan on 12.10.2024.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subTitle: String
    let angle: Double
    let background: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundStyle(background)
                .rotationEffect(.degrees(angle))
            
            VStack {
                Text(title)
                    .foregroundStyle(.white)
                    .bold()
                    .font(.system(size: 50))
                Text(subTitle)
                    .foregroundStyle(.white)
                    .font(.system(size: 30))
            }
            .padding(.top, 80)
        }
        .frame(
            width: UIScreen.main.bounds.width * 3,
            height: 350
        )
        .offset(y: -150)
    }
}


#Preview {
    HeaderView(title: "To Do List", subTitle: "Get things done", angle: 15, background: Color.indigo)
}
