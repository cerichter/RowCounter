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
    
    let p: ProjectModel
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    // ---------------------------------------- view rendering
    var body: some View {
        content
            .onReceive(timer) { date in //for every tick of the clock
                //print("\(p.projectTitle), justSeconds: \(p.justSeconds), timeSince: \(p.timeSinceLast) ")
                
                p.currentTime = date //update the current time to now
                if p.shouldRun {
                    withAnimation(.linear(duration: 1)) { //moves the progress bar 1 unit
                        switch p.justSeconds {
                        case 59:
                            p.justSeconds = 0
                        default:
                            p.justSeconds = p.getJustSeconds()
                        
                        }
                    }
                }
            }
            .onChange(of: p.count) { newVal in
                timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                p.currentTime = Date()
                p.justSeconds = 0
                if newVal != 0 { withAnimation(.linear(duration: 1)) {
                    p.justSeconds = p.justSeconds + 1
                    }
                }
            }
            .onAppear {
                if p.shouldRun { p.justSeconds = p.getJustSeconds() }
            }
    }
    
    var content: some View {
        //The seconds progress bar
        
        ProgressBar(progressValue: p.justSeconds, currentMinute: getFormattedTime())
        
    }
    
    //---------------------------------------- formatting time
    
    
    func getFormattedTime() -> String {
        //formats the time for text in timer
        
        let formatter = DateComponentsFormatter()
        
        formatter.allowedUnits = [.minute, .hour]
        formatter.unitsStyle = .abbreviated
        
        if p.shouldRun == false {
            return "0m"
        }
        
        return formatter.string(from: TimeInterval(p.timeSinceLast)) ?? "?"
        
    }
    
}
