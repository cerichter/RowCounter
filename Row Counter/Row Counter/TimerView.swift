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
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var timeSinceLast: TimeInterval = 0
    var formattedSinceLast = ""
    
    
    let formatter = DateComponentsFormatter()


    
    var body: some View {
        
        HStack {
            Text("Last Updated: \(timeSinceLast)")
                .onReceive(timer) { date in
                    //print(formatTimeSince())
                    timeSinceLast = Date().timeIntervalSince(lastTime)
                    
                    
                }
            
        }
        
    }
    
//    func formatTimeSince() -> String {
//
//        let inProcessingTime = round(timeSinceLast)
//        let floorVal = floor(inProcessingTime/60)
//        var finalTime: String = ""
//
//        if floorVal == 0{
//            finalTime = String(inProcessingTime) + " s ago"
//        }
//        else if (1..<59).contains(floorVal){
//            finalTime = String(floorVal) + "m, " + Int(inProcessingTime) % 60 + " s ago"
//        }
//        else{
//            var floorFloorVal = floor(floorVal/60))
//            finalTime = String(floorFloorVal) + " h, " + String(floorVal) + "m, " + Int(inProcessingTime) % 60 + " s ago"
//        }
//
//        return finalTime
//
//    }
    
}
