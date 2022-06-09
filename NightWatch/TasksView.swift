//
//  TasksView.swift
//  NightWatch
//
//  Created by Arnulfo Duran on 12/05/22.
//

import SwiftUI

struct TasksView: View {
    @ObservedObject var nightWatchTasks: NightWatchTask
    @State var isFocusModeOn: Bool = false
    @State var isResetAlertShowing: Bool = false
    
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
                        
                        if isFocusModeOn == false || (isFocusModeOn && task.isComplete == false) {
                            NavigationLink(destination: DetailsView(task: theTasksBinding), label: { TaskRow(task: task) })
                        }
                    })
                        .onDelete(perform: { indexSet in
                            nightWatchTasks.nightlyTasks.remove(atOffsets: indexSet)
                        })
                        .onMove { indices, newOffset in
                            nightWatchTasks.nightlyTasks.move(fromOffsets: indices, toOffset: newOffset)
                        }
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
                        
                        if isFocusModeOn == false || (isFocusModeOn && task.isComplete == false) {
                            NavigationLink(destination: DetailsView(task: theTasksBinding), label: { TaskRow(task: task) })
                        }
                    })
                        .onDelete(perform: { indexSet in
                            nightWatchTasks.weeklyTasks.remove(atOffsets: indexSet)
                        })
                        .onMove { indices, newOffset in
                            nightWatchTasks.weeklyTasks.move(fromOffsets: indices, toOffset: newOffset)
                        }
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
                        
                        if isFocusModeOn == false || (isFocusModeOn && task.isComplete == false) {
                            NavigationLink(destination: DetailsView(task: theTasksBinding), label: { TaskRow(task: task) })
                        }
                    })
                        .onDelete(perform: { indexSet in
                            nightWatchTasks.monthlyTasks.remove(atOffsets: indexSet)
                        })
                        .onMove { indices, newOffset in
                            nightWatchTasks.monthlyTasks.move(fromOffsets: indices, toOffset: newOffset)
                        }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Home")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Reset") {
                        isResetAlertShowing = true
                    }
                }
                
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
                    Toggle(isOn: $isFocusModeOn) {
                        Text("Focus Mode")
                    }
                    Spacer()
                }
            }
        }.alert(isPresented: $isResetAlertShowing, content: {
            Alert(
                title: Text("Reset List"),
                message: Text("Are you sure?"),
                primaryButton: .cancel(),
                secondaryButton: .destructive(
                    Text("Yes, reset it"),
                    action: {
                        let refreshNightWatchTasks = NightWatchTask()
                        self.nightWatchTasks.nightlyTasks = refreshNightWatchTasks.nightlyTasks
                        self.nightWatchTasks.weeklyTasks = refreshNightWatchTasks.weeklyTasks
                        self.nightWatchTasks.monthlyTasks = refreshNightWatchTasks.monthlyTasks
                    })
            )
        })
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
        TasksView(nightWatchTasks: NightWatchTask(), isFocusModeOn: false)
    }
}
