//
//  ProjectController.swift
//  Row Counter
//
//  Created by Corinne Richter on 9/27/23.
//

import Foundation
import SwiftUI

class ProjectController: ObservableObject {
    
    @State var listOfProjects: [ProjectModel]
    @State var selectedProject: UUID
    
    //let tabController = TabController()
    
    init() {
        
        let initialProjects: [ProjectModel] = [.init()]
        self._listOfProjects = State(initialValue: initialProjects)
        self._selectedProject = State(initialValue: initialProjects[0].id)
        
    }
    
    func setNewProject() {
        // creates a new ProjectModel and adds it to the list and changes the focused project to the newest one
        
        let newProject: ProjectModel = .init() // Adds project to the list of projects
        listOfProjects.append(newProject)
        
//        let saver = SaveProjectsController(listOfProjects: listOfProjects) // saves new project
//        saver.readJSON()

    }
    
    func removeProject() {
        // removes project
        
        if listOfProjects.count == 1 {
            
            listOfProjects.append(ProjectModel.init())
            listOfProjects.remove(at: listOfProjects.startIndex)
        }
        
        else {
            
            //listOfProjects.remove(at: selectedProject)
        }
    }
    
    
}
