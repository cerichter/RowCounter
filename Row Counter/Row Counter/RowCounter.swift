//
//  rowCounter.swift
//  Row Counter
//
//  Created by Corinne Richter on 9/8/23.
//

import Foundation
import SwiftUI

struct RowCounter: View {

    
    // -------------------------------- Variables
    @State var counter: Int = 0
    @State var lastTime: Date = Date()
    
    @State var showTimer: Bool = true //TO DO: ADD OPTION TO TURN THE TIMER OFF
    var run: Bool { shouldRun() }
    
    //@AppStorage("savedCount") var savedCount: Int = 0
    //var isFirstOpen: Bool { counter == 0 ? true : false  }

    // -------------------------------- Layout
    var body: some View {
        
        VStack (spacing: 20) {
            Text(counter.description)
                .font(Font.monospacedDigit(Font.system(size: 100).weight(.light))())
            if showTimer {TimerView(lastTime: lastTime, run: run)}
            HStack(spacing: 10) { // contains the inc and dec buttons
                decButton()
                incButton()
            }
            resetButton()
        }
    }
    
    // -------------------------------- Buttons
    @ViewBuilder
    func decButton () -> some View {
        // button to decrease the row count
        Button {
            if counter > 0 { // preventing count from being negative
                lastTime = Date() // changes time since last row update
                counter -= 1
                //savedCount = counter
            }

        } label: { // button formatting
            Image(systemName: "minus")
                .frame(width: 84, height: 64)
                .foregroundColor(.white)
                .background{
                    Color.purple
                }
                .cornerRadius(10)
        }
        .buttonStyle(.plain)
        
    }
    
    
    @ViewBuilder
    func incButton () -> some View {
        // button to increase the row count
        Button {
            lastTime = Date() // changes time since last row update
            counter += 1 // increases row count
            //savedCount = counter
            
        } label: { // button formatting
            Image(systemName: "plus")
                .frame(width: 84, height: 64)
                .foregroundColor(.white)
                .background{
                    Color.purple
                }
                .cornerRadius(10)
        }
        .buttonStyle(.plain)
        
    }
    
    @ViewBuilder
    func resetButton () -> some View {
        //RESET button
        Button { // resets the count to 0
            lastTime = Date()
            counter = 0
            //savedCount = 0
        } label: {
            Text("Reset")
            .frame(width: 188, height: 44)
            .foregroundColor(.white)
            .background{
                Color.pink
                    .opacity(0.7)
            }
            .cornerRadius(10)
        }
        .buttonStyle(.plain)
    }
    
    func shouldRun () -> Bool {
        //Determins if the progress bar timer should run
        //If the counter is at 0 or at the saved value it should not run, otherwise it should
    
        if counter == 0  {
            return false
        }
        else {
            return true
        }
    }

}

