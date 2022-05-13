//
//  ProfileView.swift
//  NightWatch
//
//  Created by Arnulfo Duran on 12/05/22.
//

import SwiftUI

struct ProfileView: View {
    @StateObject private var theGuard = Guard(name: "Arnulfo", age: 25, isTasksCompleted: false)
    
    var body: some View {
        VStack {
            Text("Guard Information")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.blue)
            
            InformationPanel(theGuard: self.theGuard)
            
            Button(action: {
                self.theGuard.isTasksCompleted = !self.theGuard.isTasksCompleted
            }) {
                Text(self.theGuard.isTasksCompleted ? "Mark as NOT completed" : "Mark as completed")
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
    @ObservedObject var theGuard: Guard

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
        ProfileView()
    }
}
