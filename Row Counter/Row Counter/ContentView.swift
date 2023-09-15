//
//  ContentView.swift
//  Row Counter
//
//  Created by Corinne Richter on 9/8/23.
//

import SwiftUI

struct ContentView: View {
    
    //STEPS
    // 1. make a data model that contains all data that needs to persist about individual row counter
    // 2. update row counter view to use 1.
    // 2.1 store state in content view and properly propgate any changes made my RowCounterView
    // 3. make a button that adds a new one, delete, and edits
    
    //@AppStorage("savedProjects") var savedProjects: [ProjectModel] = .init()  //saved projects
    
    @State var listOfProjects: [ProjectModel] = .init()
    
    var body: some View {
        
        NavigationStack {
            HStack {
                TabView {
                    RowCounter()
                    RowCounter()
                }
                .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .always))
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        //button action
                    } label: {
                        Image(systemName: "plus.circle")
                    }
                    .frame(width: 20, height: 20)
                    .foregroundColor(.gray)
                }
            }
        }
    }
}
