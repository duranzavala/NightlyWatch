//
//  TasksView.swift
//  NightWatch
//
//  Created by Arnulfo Duran on 12/05/22.
//

import SwiftUI

let nightlyTasks = [
   "Check all windows",
   "Check all doors",
   "Check that the safe is locked",
   "Inspect the mailbox",
   "Inspect security cameras",
   "Clear ice from sidewalks",
   "Document \"strange and unusual\" occurrences",
]

let weeklyTasks = [
    "Check inside all vacant rooms",
    "Walk the perimeter of property",
]

let monthlyTasks = [
    "Test security alarm",
    "Test motion detectos",
    "Test smoke alarms",
]

struct TasksView: View {
    
    var body: some View {
        NavigationView {
            List {
                Section(header: TaskSectionHeader(symbolSystemName: "moon.stars", headerText: "Nightly Tasks")) {
                    ForEach(nightlyTasks, id: \.self, content: { taskName in
                        NavigationLink(taskName, destination: DetailsView())
                    })
                }
                Section(header: TaskSectionHeader(symbolSystemName: "sunset", headerText: "Weekly Tasks")) {
                    ForEach(weeklyTasks, id: \.self, content: { taskName in
                        NavigationLink(taskName, destination: DetailsView())
                    })
                }
                Section(header: TaskSectionHeader(symbolSystemName: "calendar", headerText: "Monthly Tasks")) {
                    ForEach(monthlyTasks, id: \.self, content: { taskName in
                        NavigationLink(taskName, destination: DetailsView())
                    })
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Home")
        }
    }
}

struct TaskSectionHeader: View {
    let symbolSystemName: String
    let headerText: String
    
    var body: some View {
        HStack {
            Image(systemName: symbolSystemName)
            Text(headerText)
        }
        .font(.title3)
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
    }
}
