//
//  DetailsView.swift
//  NightWatch
//
//  Created by Arnulfo Duran on 12/05/22.
//

import SwiftUI

struct DetailsView: View {
    @State private var theTask = Task(name: "Check all windows", isComplete: false, lastCompleted: nil)
    
    var body: some View {
        VStack {
            HStack {
                // Checkmark IF complete
                Image(systemName: theTask.isComplete ? "checkmark.square" : "square")
                Text("\(theTask.name)")
            }
            ControlPanel(theTask: $theTask)
        }
    }
}

struct ControlPanel: View {
    @Binding var theTask: Task
    
    var body: some View {
        if theTask.isComplete == false {
            Button(action: {
                theTask.isComplete = true
            }) {
                Text("Mark Complete")
            }.padding(.top)
        } else {
            Button(action: {
                theTask.isComplete = false
            }) {
                Text("Reset")
            }.padding(.top)
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}
