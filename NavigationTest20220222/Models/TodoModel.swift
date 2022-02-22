//
//  TodoModel.swift
//  NavigationTest20220222
//
//  Created by 桃井優太 on 2022/02/22.
//

import Foundation

struct TodoModel: Identifiable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool){
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func onCompletedToggle() -> TodoModel {
        return TodoModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
