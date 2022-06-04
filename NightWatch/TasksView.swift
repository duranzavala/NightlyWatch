//
//  TasksView.swift
//  NightWatch
//
//  Created by Arnulfo Duran on 12/05/22.
//

import SwiftUI

struct TasksView: View {
    @ObservedObject var nightWatchTasks: NightWatchTask
    
    var body: some View {
        NavigationView {
            List {
                Section(header: TaskSectionHeader(symbolSystemName: "moon.stars", headerText: "Nightly Tasks")) {
                    // Get both task and its index in an array
                    let taskIndices = nightWatchTasks.nightlyTasks.indices
                    let tasks = nightWatchTasks.nightlyTasks
                    let taskIndexPairs = Array(zip(tasks, taskIndices))
                    
                    ForEach(taskIndexPairs, id: \.0.id, content: { task, taskIndex in
                        // Get an instance of nightWatchTasks
                        let nightWatchTaskWrapper = $nightWatchTasks

                        // Make binding using the wrapper
                        let taskBinding = nightWatchTaskWrapper.nightlyTasks
                        
                        // Extract the task
                        let theTasksBinding = taskBinding[taskIndex]
                        
                        NavigationLink(destination: DetailsView(task: theTasksBinding), label: { TaskRow(task: task) })
                    })
                }
                Section(header: TaskSectionHeader(symbolSystemName: "sunset", headerText: "Weekly Tasks")) {
                        // Get both task and its index in an array
                        let taskIndices = nightWatchTasks.weeklyTasks.indices
                        let tasks = nightWatchTasks.weeklyTasks
                        let taskIndexPairs = Array(zip(tasks, taskIndices))
                        
                        ForEach(taskIndexPairs, id: \.0.id, content: { task, taskIndex in
                        // Get an instance of nightWatchTasks
                        let nightWatchTaskWrapper = $nightWatchTasks
                        
                        // Make binding using the wrapper
                        let taskBinding = nightWatchTaskWrapper.weeklyTasks
                        
                        // Extract the task
                        let theTasksBinding = taskBinding[taskIndex]
                        
                        NavigationLink(destination: DetailsView(task: theTasksBinding), label: { TaskRow(task: task) })
                    })
                }
                Section(header: TaskSectionHeader(symbolSystemName: "calendar", headerText: "Monthly Tasks")) {
                        // Get both task and its index in an array
                        let taskIndices = nightWatchTasks.monthlyTasks.indices
                        let tasks = nightWatchTasks.monthlyTasks
                        let taskIndexPairs = Array(zip(tasks, taskIndices))
                        
                        ForEach(taskIndexPairs, id: \.0.id, content: { task, taskIndex in
                        // Get an instance of nightWatchTasks
                        let nightWatchTaskWrapper = $nightWatchTasks
                        
                        // Make binding using the wrapper
                        let taskBinding = nightWatchTaskWrapper.monthlyTasks
                        
                        // Extract the task
                        let theTasksBinding = taskBinding[taskIndex]
                        
                        NavigationLink(destination: DetailsView(task: theTasksBinding), label: { TaskRow(task: task) })
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

struct TaskRow: View {
    let task: Task
    
    var body: some View {
        VStack {
            if task.isComplete {
                HStack {
                    Image(systemName: "checkmark.square")
                    Text(task.name)
                        .foregroundColor(.gray)
                        .strikethrough()
                }
            } else {
                HStack {
                    Image(systemName: "square")
                    Text(task.name)
                }
            }
        }
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView(nightWatchTasks: NightWatchTask())
    }
}
