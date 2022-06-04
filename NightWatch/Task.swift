//
//  Task.swift
//  NightWatch
//
//  Created by Arnulfo Duran on 12/05/22.
//

import Foundation

struct Task: Identifiable {
    let id = UUID()
    let name: String
    var isComplete: Bool
    var lastCompleted: Date?
}
