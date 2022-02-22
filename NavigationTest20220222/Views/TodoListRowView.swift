//
//  TodoListRowView.swift
//  NavigationTest20220222
//
//  Created by 桃井優太 on 2022/02/22.
//

import SwiftUI

struct TodoListRowView: View {
    let todo: TodoModel
    let onCompletedToggle: () -> Void
    var body: some View {
        HStack {
            Button (action: onCompletedToggle, label: {
                Image(systemName: todo.isCompleted ? "checkmark.circle" : "circle")
                    .foregroundColor(todo.isCompleted ? .green : Color(UIColor.placeholderText))
            })
            
            Text(todo.title)
                .strikethrough(todo.isCompleted)
            Spacer()
        }
    }
}

struct TodoListRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TodoListRowView(todo: TodoModel(title: "Test Item", isCompleted: true), onCompletedToggle:{})
            TodoListRowView(todo: TodoModel(title: "Test Item", isCompleted: false), onCompletedToggle:{})
        }.previewLayout(.sizeThatFits)
    }
}
