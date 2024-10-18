//
//  ToDoListItemVIew.swift
//  ToDoList
//
//  Created by Hakob Ghlijyan on 10.10.2024.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject private var viewModel: ToDoListItemViewModel = ToDoListItemViewModel()
    let item: ToDoListItem
    
    var body: some View {
        HStack {
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
                    .foregroundStyle( item.isDone ? .green : .red)
                    .font(.title3)
            }

        }
    }
}

#Preview {
    VStack(spacing: 100.0) {
        ToDoListItemView(
            item: .init(
                id: "123",
                title: "Get milk",
                description: "buy 1 liter",
                dueDate: Date().timeIntervalSince1970,
                createdDate: Date().timeIntervalSince1970,
                isDone: false
            )
        )
        
        ToDoListItemView(
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

