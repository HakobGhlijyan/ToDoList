//
//  NewItemView.swift
//  ToDoList
//
//  Created by Hakob Ghlijyan on 10.10.2024.
//

import SwiftUI

struct NewItemView: View {
    @StateObject private var viewModel: NewItemViewModel = NewItemViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
            
            Form {
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(.plain)
                
                TextField("Description", text: $viewModel.description)
                    .textFieldStyle(.plain)
                
                DatePicker("Date", selection: $viewModel.dueDate)
                    .datePickerStyle(.graphical)
                
                TLButtonView(title: "Save", backgroundColor: .green) {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"), message: Text("Please fill all fields and select due date that is today or newer."))
            }
        }
    }
}

#Preview {
    NewItemView(newItemPresented: .constant(true))
        .preferredColorScheme(.dark)
}
