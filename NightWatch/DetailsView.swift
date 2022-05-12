//
//  DetailsView.swift
//  NightWatch
//
//  Created by Arnulfo Duran on 12/05/22.
//

import SwiftUI

struct DetailsView: View {
    let taskName: String
    var body: some View {
        VStack {
            Text("\(taskName)")
            Text("Placeholder for task description")
            Text("Placeholder for mark complete button")
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(taskName: "Test Task")
    }
}
