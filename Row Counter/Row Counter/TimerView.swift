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
    
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect() //primary timer
    @State var currentTime: Date = Date()
    
    var timeSinceLast: TimeInterval { currentTime.timeIntervalSince(lastTime) } //computes the time between lastTime and currentTime
    
    // ----------------------------------------- progress bar
    
    @State var justSeconds: Int = 0
    
    // ---------------------------------------- formatting time, see bottom
    
    var formattedSinceLast: String { initDateFormatter() }
    
    // ---------------------------------------- view rendering
    var body: some View {
        content
            .onReceive(timer) { date in
                currentTime = date
                if run {
                    withAnimation(.linear(duration: 1)) {
                        justSeconds = (justSeconds + 1) % 60
                    }
                }
            }
            .onChange(of: lastTime) { newVal in
                timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                currentTime = newVal
                justSeconds = 0
            }
    }
    
    var content: some View {
        VStack (spacing: 10){
            Text("Time Since Last Update:")
            HStack { //The seconds progress bar
                ProgressBar(progressValue: justSeconds, currentMinute: (Int(floor(timeSinceLast/60))))
                //Text("\(Int(floor(timeSinceLast/60))) m")
            }
            
        }
        .font(Font.monospacedDigit(Font.system(size: 20).weight(.light))())
    }
    
    //---------------------------------------- formatting time
    
    
    func initDateFormatter() -> String {
        
        let formatter = DateComponentsFormatter()
        
        formatter.allowedUnits = [.second, .minute, .hour]
        formatter.unitsStyle = .short
        
        var formattedSinceLast: String { formatter.string(from: timeSinceLast) ?? "0" }
        
        return formattedSinceLast
        
    }
}
