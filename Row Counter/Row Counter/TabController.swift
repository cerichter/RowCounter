//
//  TabController.swift
//  Row Counter
//
//  Created by Corinne Richter on 9/15/23.
//

import Foundation
import SwiftUI


class TabController: ObservableObject {
    
    @Published var selectedProject = 0

    func changeTab(projectIndex: Int) {
        withAnimation(.easeIn) {
            self.selectedProject = projectIndex
        }
    }
}
