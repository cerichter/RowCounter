//
//  ProjectModel.swift
//  Row Counter
//
//  Created by Corinne Richter on 9/14/23.
//

import Foundation
import SwiftUI

class ProjectModel: ObservableObject, Identifiable {
    
    @Published var count: Int //row count
    //@Published var savedCount: Int

    var initialCountValue: Int //the inital value to be desplayed

    @Published var title: String //name of the project
    
    var id: UUID 
    

    // --------------------------------------------------------------------------------------- Progress Bar Variables
    
    @Published var lastTime: Date = Date() //the last time a button was pressed
    @Published var firstTime: Bool //keeps track if action has been made on this open yet
    @Published var currentTime: Date = Date()
    
    var timeSinceLast: TimeInterval { currentTime.timeIntervalSince(lastTime) } //computes the time between lastTime and currentTime
    var shouldRun: Bool { !(count == 0 || (count == initialCountValue && firstTime == true)) }
    @Published var justSeconds: Int = 0

    // --------------------------------------------------------------------------------------- Methods
    init() {
        //default Project
        
        self.count = 0
        //self.savedCount = 0
        self.lastTime = Date()
        self.initialCountValue = 0
        self.firstTime = true
        self.title = ""
        
        self.id = UUID()

    }
    
    
    func resetCount() {
        //resets the row count to 0
        
        count = 0
        lastTime = Date()
        firstTime = false
    }
    
    func decCount() {
        //decreaces count by one
        
        if count > 0 { count = count - 1 }
        lastTime = Date()
        firstTime = false
    }
    
    func incCount() {
        // increases count by one
        
        count = count + 1
        lastTime = Date()
        firstTime = false
    }
    
    
    func setProjectTitle(projectTitle: String) {
        //sets the project title
        
        title = projectTitle
        
    }
    
    func computeJustSeconds() -> Int {
        
        return Int(timeSinceLast.truncatingRemainder(dividingBy: 60))
    }
    
    
}
