//
//  DetailsView.swift
//  NightWatch
//
//  Created by Arnulfo Duran on 12/05/22.
//

import SwiftUI

struct DetailsView: View {
    @Binding var task: Task
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
        VStack {
            Image("FloorPlan")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text(task.name)
                .font(.title)
            
            if verticalSizeClass == .regular {
                Divider()
                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesett ing, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                Divider()
            }
            
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
            .previewInterfaceOrientation(.portrait)
    }
}
