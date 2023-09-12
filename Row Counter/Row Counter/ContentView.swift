//
//  ContentView.swift
//  Row Counter
//
//  Created by Corinne Richter on 9/8/23.
//

import SwiftUI

struct ContentView: View {
    
    //@AppStorage("savedCount") var savedCount: Int = 0
    
    var body: some View {
        VStack {
            RowCounter()
        }
        .padding()
    }
}
