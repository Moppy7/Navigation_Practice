//
//  AddTodoViewModel.swift
//  NavigationTest20220222
//
//  Created by 桃井優太 on 2022/02/22.
//

import Foundation

class AddTodoViewModel: ObservableObject {
    @Published var title :String = ""
    
    func canSave () -> Bool {
        if title.isEmpty {
            return false
        } else if title.count < 5 {
            return false
        }
        return true
    }
    
    func getTodo(id: String = UUID().uuidString) -> TodoModel {
        return TodoModel(id: id, title: title, isCompleted: false)
    }
}
