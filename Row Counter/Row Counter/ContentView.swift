//
//  ContentView.swift
//  Row Counter
//
//  Created by Corinne Richter on 9/8/23.
//

import SwiftUI

struct ContentView: View {

    //@AppStorage("savedProjects") var savedProjects: [ProjectModel] = .init() //saved projects
    
    @State var listOfProjects: [ProjectModel] = [.init()]
    @ObservedObject var projectSelecter = TabController()
    
    var body: some View {
        
        NavigationStack {
            HStack {
                TabView(selection: $projectSelecter.selectedProject) {
                    ForEach(Array(listOfProjects.enumerated()), id: \.offset) { index, project in
                        RowCounterView(myProject: project)
                            .tabItem {
                                Image(systemName: "circle")
                            }
                            .tag(index)
                        
                    }
                }
                .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .always))
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        //button action
                        
                        setNewProject()
                        
                    } label: {
                        Image(systemName: "plus.circle")
                    }
                    .frame(width: 20, height: 20)
                    .foregroundColor(.gray)
                }
            }
        }
    }
    
    
    func setNewProject() {
        // creates a new ProjectModel and adds it to the list and changes the focused project to the newest one
        
        let newProject: ProjectModel = .init()
        listOfProjects.append(newProject)
        projectSelecter.changeTab(projectIndex: listOfProjects.count - 1)

    }
}
