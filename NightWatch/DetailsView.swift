//
//  DetailsView.swift
//  NightWatch
//
//  Created by Arnulfo Duran on 12/05/22.
//

import SwiftUI

struct DetailsView: View {
    @Binding var task: Task
//    @State private var theTask = Task(name: "Check all windows", isComplete: false, lastCompleted: nil)
    
    var body: some View {
        VStack {
            Text(task.name)
            Text("Placeholder for task description")
            ControlPanel(theTask: $task)
        }
    }
}

struct ControlPanel: View {
    @Binding var theTask: Task
    
    var body: some View {
        if theTask.isComplete {
            Button(action: {
                theTask.isComplete = false
            }) {
                Text("Reset")
            }.padding(.top)
        } else {
            Button("Mark Complete") {
                theTask.isComplete = true
            }
            .padding(.top)
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(task: Binding<Task>.constant(Task(name: "Test Task", isComplete: false, lastCompleted: nil)))
    }
}
