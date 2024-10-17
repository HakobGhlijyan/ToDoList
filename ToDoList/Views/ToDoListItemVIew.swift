//
//  ToDoListItemVIew.swift
//  ToDoList
//
//  Created by Hakob Ghlijyan on 10.10.2024.
//

import SwiftUI

struct ToDoListItemVIew: View {
    @StateObject private var viewModel: ToDoListItemViewModel = ToDoListItemViewModel()
    let item: ToDoListItem
    
    var body: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading) {
                HStack(alignment: .firstTextBaseline) {
                    Text(item.title).font(.headline).fontWeight(.bold).foregroundStyle(.primary)
                    Spacer()
                    Text(item.description).font(.subheadline).fontWeight(.semibold).foregroundStyle(.secondary)
                }
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.caption)
                    .foregroundStyle(.tertiary)
            }
            
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
            }

        }
    }
}

#Preview {
    VStack(spacing: 100.0) {
        ToDoListItemVIew(
            item: .init(
                id: "123",
                title: "Get milk",
                description: "buy 1 liter",
                dueDate: Date().timeIntervalSince1970,
                createdDate: Date().timeIntervalSince1970,
                isDone: false
            )
        )
        
        ToDoListItemVIew(
            item: .init(
                id: "123",
                title: "Get milk",
                description: "buy 1 liter",
                dueDate: Date().timeIntervalSince1970,
                createdDate: Date().timeIntervalSince1970,
                isDone: true
            )
        )
    }
    .preferredColorScheme(.dark)
}

