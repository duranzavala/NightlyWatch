//
//  ContentView.swift
//  NightWatch
//
//  Created by Arnulfo Duran on 11/05/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var theGuard: Guard
    @StateObject var nightWatchTasks = NightWatchTask()

    var body: some View {
        TabView {
            TasksView(nightWatchTasks: nightWatchTasks)
                .tabItem({
                    Image(systemName: "checklist")
                    Text("Tasks")
                })
                
            ProfileView().tabItem({
                Image(systemName: "person")
                Text("Profile")
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let previewGuard = Guard(name: "Arnulfo", age: 25, isTasksCompleted: false)
        
        ContentView()
            .environmentObject(previewGuard)
    }
}
