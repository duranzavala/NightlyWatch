//
//  ProfileView.swift
//  NightWatch
//
//  Created by Arnulfo Duran on 12/05/22.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var theGuard: Guard
    
    var body: some View {
        VStack {
            Text("Guard Information")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.blue)
            
            InformationPanel()
            
            Button(action: {
                self.theGuard.isTasksCompleted = !self.theGuard.isTasksCompleted
            }) {
                Text(theGuard.isTasksCompleted ? "Mark as NOT completed" : "Mark as completed")
                    .font(.title3)
            }
            .foregroundColor(.blue)
            .padding(.top)
            
            Spacer()
        }
        .foregroundColor(.gray)
        .padding()
    }
}

struct InformationPanel: View {
    @EnvironmentObject var theGuard: Guard

    var body: some View {
        VStack {
            HStack {
                Text("Name: ")
                    .fontWeight(.heavy)
                Spacer()
                Text(theGuard.name)
                    .foregroundColor(.blue)
            }
            
            HStack {
                Text("Age: ")
                    .fontWeight(.heavy)
                Spacer()
                Text("\(theGuard.age)")
                    .foregroundColor(.blue)
            }
            
            HStack {
                Text("Tasks Completed: ")
                    .fontWeight(.heavy)
                Spacer()
                Text("\(theGuard.isTasksCompleted ? "Yes" : "No")")
                    .foregroundColor(.blue)
            }
        }
        .font(.title3)
        .padding()
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        let previewGuard = Guard(name: "Arnulfo", age: 25, isTasksCompleted: false)
        
        ProfileView()
            .environmentObject(previewGuard)
    }
}
