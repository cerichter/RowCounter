//
//  rowCounter.swift
//  Row Counter
//
//  Created by Corinne Richter on 9/8/23.
//

import Foundation
import SwiftUI

struct RowCounterView: View {
    
    @StateObject var myProject: ProjectModel
    
    // -------------------------------- Layout
    var body: some View {
        
        VStack(spacing: 10) {
            TextField(
                myProject.projectTitle,
                text: $myProject.projectTitle,
                prompt: Text("Project Title")
            )
            .multilineTextAlignment(.center)
            Text(myProject.count.description)
                .font(Font.monospacedDigit(Font.system(size: 100).weight(.light))())
            TimerView(myProject: myProject)
            HStack(spacing: 10) { // contains the inc and dec buttons
                decButton()
                incButton()
            }
            resetButton()
        }
        .onAppear {
            print(myProject.projectTitle)
        }
    }
    
    // -------------------------------- Buttons
    @ViewBuilder
    func decButton () -> some View {
        // button to decrease the row count
        
        Button {
            myProject.decCount()
            
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
            myProject.incCount()
            
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
            myProject.resetCount()
            
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

    
}

