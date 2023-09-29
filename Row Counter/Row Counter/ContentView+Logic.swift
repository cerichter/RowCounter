//
//  ProjectController.swift
//  Row Counter
//
//  Created by Corinne Richter on 9/27/23.
//

import Foundation
import SwiftUI

extension ContentView {
    
    func setNewProject() {
        // creates a new ProjectModel and adds it to the list and changes the focused project to the newest one
        let newProject: ProjectModel = .init() // Adds project to the list of projects
        withAnimation() {
            listOfProjects.append(newProject)
            selectedProject = newProject.id
        }
//        let saver = SaveProjectsController(listOfProjects: listOfProjects) // saves new project
//        saver.readJSON()
    }
    
    func removeProject() {
        // removes project
        if listOfProjects.count == 1 {
            listOfProjects = [.init()]
            selectedProject = listOfProjects[0].id
        } else {
            guard let index = listOfProjects.firstIndex(where: { $0.id == selectedProject }) else {
                assertionFailure("No project found with ID \(selectedProject)")
                return
            }
            listOfProjects.remove(at: index)
            selectedProject = listOfProjects[index-1].id
        }
    }
    
    
}
