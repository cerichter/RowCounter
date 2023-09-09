//
//  rowCounter.swift
//  Row Counter
//
//  Created by Corinne Richter on 9/8/23.
//

import Foundation
import SwiftUI

struct RowCounter: View {
    
    @State var counter: Int = 0
    @State var lastTime: Date = Date()

    var body: some View {
        
        VStack {
            Text(counter.description)
                .font(.title)
            TimerView(lastTime: lastTime)
            HStack(spacing: 20) { // contains the inc and dec buttons
                decButton()
                incButton()
            }
        }
    }
    
    @ViewBuilder
    func decButton () -> some View {
        // button to decrease the row count
        
        Button {
            if counter > 0 { // preventing count from being negative
                lastTime = Date() // changes time since last row update
                counter -= 1
            }

        } label: { // button formatting
            Image(systemName: "minus")
                .frame(width: 44, height: 44)
                .foregroundColor(.white)
                .background{
                    Color.purple
                        .opacity(0.4)
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
            
        } label: { // button formatting
            Image(systemName: "plus")
                .frame(width: 44, height: 44)
                .foregroundColor(.white)
                .background{
                    Color.purple
                }
                .cornerRadius(10)
        }
        
        .buttonStyle(.plain)
        
    }
    

}

