//
//  ContentModel.swift
//  LearningApp
//
//  Created by Athanasios Chatzikonstantinou on 02.06.21.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var modules = [Module]()
    
    var styleData: Data?
    
    init() {
        getLocalData()
    }
    
    func getLocalData() {
        //Get a url to the JSON file
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do {
            //Read file into a data object
            let jsonData = try Data(contentsOf: jsonUrl!)
            
            //Try to decode the JSON into an array of modules
            let jsonDecoder = JSONDecoder()
            let modules = try jsonDecoder.decode([Module].self, from: jsonData)
            
            //Assign parsed modules to modules property
            self.modules = modules
        }
        catch {
            //TODO log error
            print("Could not parse local data")
        }
        
        //Parse the style data
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do {
            let styleData = try Data(contentsOf: styleUrl!)
            
            self.styleData = styleData
        }
        catch {
            print("Could not parse style data")
        }
    }
}
