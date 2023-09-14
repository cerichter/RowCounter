//
//  ProgressBar.swift
//  Row Counter
//
//  Created by Corinne Richter on 9/11/23.
//

import Foundation
import SwiftUI



struct ProgressBar: View {
    
    let progressValue: Int //The seconds from the current minute, from timer view
    let currentMinute: String
    
    var body: some View {
        
        Rectangle() //background rectange
            .frame(width: 178, height: 30)
            .foregroundColor(.teal)
            .opacity(0.2)
        
            .overlay { //progress rectangle
                GeometryReader { geo in
                    Rectangle()
                        .frame(width: computeBarWidth(frameWidth: geo.size.width), height: 30)
                        .foregroundColor(.teal)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            }
            .overlay { //text time readout
                Text(currentMinute)
                    .font(.callout)
                    .bold()
                    .padding(.vertical, 2)
                    .padding(.horizontal, 5)
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            }
            .cornerRadius(15)
                
            
    }
    
    
    func computeBarWidth (frameWidth: CGFloat) -> CGFloat {
        
        return frameWidth / 59.0 * CGFloat(integerLiteral: progressValue)
    
    }
}
