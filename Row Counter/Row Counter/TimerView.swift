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
    
    // ---------------------------------------- time variables
    let lastTime: Date //PERAMETER, time of last button update
    let run: Bool
    let counter: Int
    
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect() //primary timer
    @State var currentTime: Date = Date()
    
    var timeSinceLast: TimeInterval { currentTime.timeIntervalSince(lastTime) } //computes the time between lastTime and currentTime
    
    // ----------------------------------------- progress bar
    
    @State var justSeconds: Int = 0
    
    // ---------------------------------------- view rendering
    var body: some View {
        content
            .onReceive(timer) { date in
                currentTime = date
                if run {
                    withAnimation(.linear(duration: 1)) { //moves the progress bar 1 unit every 1 second
                        justSeconds =  justSeconds == 59 || run == false ? 1 : justSeconds + 1
                    }
                }
            }
            .onChange(of: counter) { newVal in
                timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                currentTime = Date()
                justSeconds = 0
                if newVal != 0 { withAnimation(.linear(duration: 1)) { // BROKEN ------------------------------------- !!!!!!!
                    justSeconds = 1
                    }
                }
            }
    }
    
    var content: some View {
        //The seconds progress bar
        
        ProgressBar(progressValue: justSeconds, currentMinute: getFormattedTime())
        
    }
    
    //---------------------------------------- formatting time
    
    
    func getFormattedTime() -> String {
        //formats the time for text in timer
        
        let formatter = DateComponentsFormatter()
        
        formatter.allowedUnits = [.minute, .hour]
        formatter.unitsStyle = .abbreviated
        
        if run == false {
            return "0m"
        }
        
        return formatter.string(from: TimeInterval(timeSinceLast)) ?? "?"
        
    }
    
}
