//
//  ContentView.swift
//  Row Counter
//
//  Created by Corinne Richter on 9/8/23.
//

import SwiftUI

struct ContentView: View {
    
    var projectController = ProjectController()
    //var save = SaveProjectsController()
    
    var body: some View {
        
        NavigationStack {
            HStack {
                ForEach(projectController.listOfProjects) { project in
                    RowCounterView(myProject: project)
                        .tabItem {
                            Image(systemName: "circle")
                        }
                        .tag(project.id)
                }
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
        }
        .toolbar { // add and remove project tool bar
            ToolbarItem(placement: .primaryAction) {
                Button { // Add new project
                    
                    projectController.setNewProject()
                    
                } label: {
                    Image(systemName: "plus.circle")
                }
                .frame(width: 20, height: 20)
                .foregroundColor(.gray)
            }
            ToolbarItem(placement: .primaryAction) {
                Button { // remove project
                    
                    projectController.removeProject()
                    
                } label: {
                    Image(systemName: "minus.circle")
                }
                .frame(width: 20, height: 20)
                .foregroundColor(.gray)
            }
            
        }
        
    }
}
