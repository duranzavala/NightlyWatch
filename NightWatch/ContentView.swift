//
//  ContentView.swift
//  NightWatch
//
//  Created by Arnulfo Duran on 11/05/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TasksView().tabItem({
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
        ContentView()
    }
}
