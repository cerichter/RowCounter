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
    
    let lastTime: Date
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var currentTime: Date = Date()
    
    var timeSinceLast: TimeInterval { currentTime.timeIntervalSince(lastTime) } //computes the time between lastTime and currentTime
    
    var formattedSinceLast = ""
    let formatter = DateComponentsFormatter()

    var body: some View {
        
        HStack {
            Text("Last Updated: \(timeSinceLast)")
                .onReceive(timer) { date in
                    currentTime = date
                }
                .onChange(of: lastTime) { newVal in
                    timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                    currentTime = newVal
                }
        }
    }
}
