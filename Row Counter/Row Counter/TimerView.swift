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
    @State var timer: Timer.TimerPublisher = Timer.publish(every: 1, on: .main, in: .common)
    
    // ---------------------------------------- view rendering
    var body: some View {
        content
            .onReceive(timer) { time  in
                p.currentTime = time
                withAnimation(.linear(duration: 1)) {
                    p.justSeconds = (p.justSeconds % 60) + 1
                }
            }
            .onChange(of: p.count) { newVal in
                //resets values when count is changed
                p.justSeconds = 0
                if p.shouldRun {
                    timer = Timer.publish(every: 1, on: .main, in: .common)
                    _ = timer.connect()
                    p.currentTime = Date()
                    withAnimation(.linear(duration: 1)) { p.justSeconds = 1 }
                } else {
                    _ = timer.connect().cancel()
                }
             }
            .onAppear {
                if p.shouldRun { p.justSeconds = p.computeJustSeconds() }
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
