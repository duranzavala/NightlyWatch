//
//  NightWatchApp.swift
//  NightWatch
//
//  Created by Arnulfo Duran on 11/05/22.
//

import SwiftUI

@main
struct NightWatchApp: App {
    @StateObject private var theGuard = Guard(name: "Arnulfo Duran", age: 25, isTasksCompleted: false)
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(theGuard)
        }
    }
}
