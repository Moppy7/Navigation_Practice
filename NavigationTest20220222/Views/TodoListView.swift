//
//  ContentView.swift
//  NavigationTest20220222
//
//  Created by 桃井優太 on 2022/02/22.
//

import SwiftUI

struct TodoListView: View {
    @StateObject var todoListVM = TodoListViewModel()
    
    var body: some View {
            List {
                ForEach(todoListVM.todoList) {item in
                    TodoListRowView(todo: item, onCompletedToggle: {
                        todoListVM.updateItem(item: item.onCompletedToggle())
                    })
                }
                .onDelete(perform: todoListVM.onDelete)
                .onMove(perform: todoListVM.onMove)
            }
            .navigationTitle(Text("To do List"))
            .navigationBarItems(leading: EditButton(), trailing: NavigationLink(destination: {
                AddTodoView { todo in
                    todoListVM.onSave(item: todo)
                }
//                どこのページに遷移するかの設定
            }, label: {
                Text("Add Item")
//                Viewに表示する言葉の設定
            }))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            TodoListView()
        }
    }
}
