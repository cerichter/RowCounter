//
//  ContentView.swift
//  Row Counter
//
//  Created by Corinne Richter on 9/8/23.
//

import SwiftUI

struct ContentView: View {
    
    //var save = SaveProjectsController()
    @State var listOfProjects: [ProjectModel]
    @State var selectedProject: UUID
    
    
    init() {
        
        let initialProjects: [ProjectModel] = [.init()]
        self._listOfProjects = State(initialValue: initialProjects)
        self._selectedProject = State(initialValue: initialProjects[0].id)
        
    }
    
    var body: some View {
        
        NavigationStack {
            HStack {
                TabView(selection: $selectedProject) {
                    ForEach(listOfProjects) { project in
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
                        if listOfProjects.count < 5 { // does not allow more than 5 projects
                            setNewProject()
                        }
                    } label: {
                        Image(systemName: "plus.circle")
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                            .background{
                                Color.teal
                                    .opacity(0.8)
                            }
                            .cornerRadius(10)
                    }
                    
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button { // remove project
                        
                        removeProject()
                        
                    } label: {
                        Image(systemName: "minus.circle")
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                            .background{
                                Color.pink
                                    .opacity(0.65)
                            }
                            .cornerRadius(10)
                    }
                    .padding()
                }
            }
        }
        
    }
}
