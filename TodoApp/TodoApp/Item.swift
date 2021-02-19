//
//  Item.swift
//  TodoApp
//
//  Created by Jeewoo Chung on 7/30/19.
//  Copyright © 2019 Jeewoo Chung. All rights reserved.
//

import Foundation

struct Item {
    var title: String
    var todoDescription: String
    var priority: Int
    var completed: Bool
    
    init (title: String, desc: String, priority: Int) {
        self.title = title
        self.todoDescription = desc
        self.priority = priority
        self.completed = false
    }
}
