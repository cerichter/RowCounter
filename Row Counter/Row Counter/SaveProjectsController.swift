//
//  SavedProjectsModel.swift
//  Row Counter
//
//  Created by Corinne Richter on 9/16/23.
//

import Foundation
import SwiftUI


class SaveProjectsController {
    
    var listOfSaves: [SaveProjectModel] //all SaveProjectModels
    let fileName = "saves.json"
    
    init(listOfProjects: [ProjectModel] ) {
        //Populates listOfSaves with project data
        
        listOfSaves = [SaveProjectModel.init(p: ProjectModel())]
        for p in listOfProjects {
            listOfSaves.append(SaveProjectModel(p: p))
        }
        
        //writeJSON()
    }
    
    func getDocumentsDirectoryUrl() -> URL {
        //gets path to save data
        
        let paths = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)
        let applicationPath = paths[0]
        return applicationPath
    }
    
//    func writeJSON() {
//        //encodes save data to JSON
//
//        let filePath = self.getDocumentsDirectoryUrl().appendingPathComponent(fileName)
//
//        do {
//            let jsonData = try JSONEncoder().encode(listOfSaves)
//
//            FileManager.default.createFile(atPath: filePath.description + fileName, contents: nil)
//            try jsonData.write(to: filePath)
//
//            } catch {
//                print("Error writing to JSON file: \(error)")
//            }
//
//        }
    
    func readJSON() {
        //decodes save data from JSON
        
        let filePath = self.getDocumentsDirectoryUrl().appendingPathComponent(fileName)
           // print(filePath)

            do {
                guard let data = try? Data(contentsOf: filePath) else { return }
                let jsonData = try JSONDecoder().decode(SaveProjectModel.self, from: data)
                print(jsonData)
             } catch {
                 print("Error reading from JSON file: \(error)")
             }
    }
            
            
            
            
            //    @AppStorage("savedProjects") var savedProjects: String = ""
            //    var listOfSaves: [SaveProjectModel]
            //
            //    init(){
            //        print("SHit sucks")
            //        listOfSaves = [SaveProjectModel.init(p: ProjectModel())]
            //        //        let jsonDecoder = JSONDecoder()
            //        //        do {
            //        //            let json = try jsonDecoder.decode(SaveProjectModel.self, from: savedProjects.data(using: .utf8) ?? SaveProjectModel(p: ProjectModel()))
            //        //        }
            //        //        catch {
            //        //            listOfSaves = []
            //        //}
            //
            //
            //        //listOfSaves
            //    }
            //    //    init () {
            //    //
            //    //        let jsonDecoder = JSONDecoder()
            //    //        listOfSaves = try jsonDecoder.decode([SaveProjectModel].self, from: savedProjects.data(using: .utf8)) ?? Data()
            //    //
            //    //        catch {
            //    //            listOfSaves.append(SaveProjectModel(p: ProjectModel()))
            //    //        }
            //    //
            //    //    }
            //
            //    func addSave(p: ProjectModel) {
            //
            //        listOfSaves.append( SaveProjectModel(p: p) )
            //    }
            //
            //    func removeSave(p: ProjectModel) {
            //
            //        if let desiredProject = listOfSaves.enumerated().first(where: {$0.element.title == p.projectTitle}) {
            //            listOfSaves.remove(at: desiredProject.offset)
            //        }
            //    }
            //
            //    func makeJSON() -> String {
            //
            //        do {
            //            let jsonEncoder = JSONEncoder()
            //            let jsonData = try jsonEncoder.encode(listOfSaves)
            //            let json = String(data: jsonData, encoding: String.Encoding.utf8)
            //
            //            return json ?? "[ ,0]"
            //        }
            //        catch {
            //            let json = "[ , 0]"
            //            return json
            //        }
            //
            //    }
            //
            //    func updateJSON() {
            //
            //        savedProjects = makeJSON()
            //
            //    }
            //
            }
