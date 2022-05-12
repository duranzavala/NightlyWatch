//
//  ContentView.swift
//  NightWatch
//
//  Created by Arnulfo Duran on 11/05/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    // MARK: Nightly Tasks
                    Group {
                        HStack {
                            Text(Image(systemName: "moon.stars"))
                                .foregroundColor(.yellow)
                                .font(.title3)
                                .fontWeight(.heavy)
                            Text("- Nightly task")
                                .underline()
                                .foregroundColor(.yellow)
                                .font(.title3)
                                .fontWeight(.heavy)
                                .padding(.top)
                                .textCase(.uppercase)
                            
                        }
                        Text("- Check all windows")
                        Text("- Check all doors")
                        Text("- Check that the safe is locked")
                        Text("- Inspect the mailbox")
                        Text("- Inspect security cameras")
                        Text("- Clear ice from sidewalks")
                        Text("- Document \"strange and unusual\" occurrences")
                    }
                    // MARK: Weekly Tasks
                    Group {
                        Divider()
                        HStack {
                            Text(Image(systemName: "sunset"))
                                .foregroundColor(.yellow)
                                .font(.title3)
                                .fontWeight(.heavy)
                            Text("- Nightly task")
                                .underline()
                                .foregroundColor(.yellow)
                                .font(.title3)
                                .fontWeight(.heavy)
                                .padding(.top)
                                .textCase(.uppercase)
                        }
                        Text("- Check inside all vacant rooms")
                        Text("- Walk the perimeter of property")
                    }
                    // MARK: Monthly Tasks
                    Group {
                        Divider()
                        HStack {
                            Text(Image(systemName: "calendar"))
                                .foregroundColor(.yellow)
                                .font(.title3)
                                .fontWeight(.heavy)
                            Text("- Nightly task")
                                .underline()
                                .foregroundColor(.yellow)
                                .font(.title3)
                                .fontWeight(.heavy)
                                .padding(.top)
                                .textCase(.uppercase)
                        }
                        Text("- Test security alarm")
                        Text("- Test motion detectos")
                        Text("- Test smoke alarms")
                    }
                }
                .foregroundColor(.gray)
                .padding([.top, .leading])
                
                Spacer()
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
