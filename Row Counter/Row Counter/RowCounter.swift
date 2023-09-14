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
    @State var counter: Int //the row count
    @State var lastTime: Date = Date() //the last time at the last the row was changed
    @State var initialCounterVal: Int //retreives the starting value from save
    @State var firstTime: Bool = true //determins if row has not been changed since opening
    
    var run: Bool { shouldRun() } //should the timer bar run, no if counter = 0 or no actions have been made
    
    @AppStorage("savedCount") var savedCount: Int = 0 //saved row count
    
    init() {
        @AppStorage("savedCount") var savedCount: Int = 0
        self._counter = State(initialValue: savedCount)
        self._initialCounterVal = State(initialValue: savedCount)
    }
    
    
    // -------------------------------- Layout
    var body: some View {
        
        VStack (spacing: 20) {
            Text(counter.description)
                .font(Font.monospacedDigit(Font.system(size: 100).weight(.light))())
            TimerView(lastTime: lastTime, run: run, counter: counter)
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
            firstTime = false
            if counter > 0 { // preventing count from being negative
                lastTime = Date() // changes time since last row update
                counter -= 1
                savedCount = counter
            }

        } label: { // button formatting
            Image(systemName: "minus")
                .frame(width: 84, height: 64)
                .foregroundColor(.white)
                .background{
                    Color.teal
                }
                .cornerRadius(10)
        }
        .buttonStyle(.plain)
        
    }
    
    
    @ViewBuilder
    func incButton () -> some View {
        // button to increase the row count
        Button {
            firstTime = false
            lastTime = Date() // changes time since last row update
            counter += 1 // increases row count
            savedCount = counter
            
        } label: { // button formatting
            Image(systemName: "plus")
                .frame(width: 84, height: 64)
                .foregroundColor(.white)
                .background{
                    Color.teal
                }
                .cornerRadius(10)
        }
        .buttonStyle(.plain)
        
    }
    
    @ViewBuilder
    func resetButton () -> some View {
        //RESET button
        Button { // resets the count to 0
            firstTime = false
            counter = 0
            lastTime = Date()
            savedCount = 0
        } label: {
            Text("Reset")
            .frame(width: 178, height: 44)
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
    
        if counter == 0 || counter == initialCounterVal || firstTime == true {
            return false
        }
        else {
            return true
        }
    }

}

