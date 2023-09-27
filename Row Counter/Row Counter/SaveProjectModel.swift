//
//  SaveProject.swift
//  Row Counter
//
//  Created by Corinne Richter on 9/17/23.
//

import Foundation

struct SaveProjectModel: Encodable, Decodable {
    
    let title: String
    let count: Int
    
    init(p: ProjectModel){
        title = p.title
        count = p.count
    }
}
