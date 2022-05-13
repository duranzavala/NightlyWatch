//
//  Guard.swift
//  NightWatch
//
//  Created by Arnulfo Duran on 12/05/22.
//

import Foundation

class Guard: ObservableObject {
    
    init(name: String, age: Int, isTasksCompleted: Bool) {
        self.name = name
        self.age = age
        self.isTasksCompleted = isTasksCompleted
    }
    
    var name: String
    var age: Int
    @Published var isTasksCompleted: Bool
}
