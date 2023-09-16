//
//  Date.swift
//  Row Counter
//
//  Created by Corinne Richter on 9/8/23.
//
import Foundation
import SwiftUI


struct TimerView: View {
    //This view contains the timer that shows the user when the last increment or decrement occured
    
    let myProject: ProjectModel
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    

    
    // ---------------------------------------- view rendering
    var body: some View {
        content
            .onReceive(timer) { date in //for every tick of the clock
                //print("\(myProject.projectTitle), justSeconds: \(myProject.justSeconds), timeSince: \(myProject.timeSinceLast) ")
                myProject.currentTime = date //update the current time to now
                
                if myProject.shouldRun {
                    withAnimation(.linear(duration: 1)) { //moves the progress bar 1 unit
                        myProject.justSeconds = myProject.justSeconds == 59 || myProject.shouldRun == false ? myProject.getJustSeconds() : myProject.justSeconds + 1
                    }
                }
            }
            .onChange(of: myProject.count) { newVal in
                timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                myProject.currentTime = Date()
                myProject.justSeconds = 0
                if newVal != 0 { withAnimation(.linear(duration: 1)) {
                    myProject.justSeconds = myProject.justSeconds + 1
                    }
                }
            }
            .onAppear {
                if myProject.shouldRun { myProject.justSeconds = myProject.getJustSeconds() }
                print(myProject.justSeconds)
            }
    }
    
    var content: some View {
        //The seconds progress bar
        
        ProgressBar(progressValue: myProject.justSeconds, currentMinute: getFormattedTime())
        
    }
    
    //---------------------------------------- formatting time
    
    
    func getFormattedTime() -> String {
        //formats the time for text in timer
        
        let formatter = DateComponentsFormatter()
        
        formatter.allowedUnits = [.minute, .hour]
        formatter.unitsStyle = .abbreviated
        
        if myProject.shouldRun == false {
            return "0m"
        }
        
        return formatter.string(from: TimeInterval(myProject.timeSinceLast)) ?? "?"
        
    }
    
}
