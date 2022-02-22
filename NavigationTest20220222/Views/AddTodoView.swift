//
//  AddItemView.swift
//  NavigationTest20220222
//
//  Created by 桃井優太 on 2022/02/22.
//

import SwiftUI

struct AddTodoView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let onSave: (_ todo: TodoModel) -> Void
    let id: String = UUID().uuidString
    @StateObject var addTodoVM = AddTodoViewModel()
    
    var body: some View {
        VStack {
            ScrollView {
                TextField("Todo", text: $addTodoVM.title)
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(12)
                    .onSubmit{
                        onSaveClick()
                    }
            }
            Button {
                if addTodoVM.canSave() {
                    onSaveClick()
                }
            } label: {
                Text("Save")
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(height: 56)
                    .frame(maxWidth: .infinity)
                    .background(.primary)
                    .cornerRadius(16)
            }

        }.padding()
        .navigationTitle("Add Todo")
    }
    
    func onSaveClick() {
        let todo: TodoModel = addTodoVM.getTodo(id: id)
        onSave(todo)
        presentationMode.wrappedValue.dismiss()
    }
    
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddTodoView { todo in
            }
        }
    }
}
