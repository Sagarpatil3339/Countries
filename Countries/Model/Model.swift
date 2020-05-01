//
//  Model.swift
//  Countries
//
//  Created by Prasad Patil on 4/29/20.
//  Copyright © 2020 Prasad Patil. All rights reserved.
//

/* Modelling JSON data into structures using CODABLE and setting them into arrays */

import Foundation

class DataModel {
    var countries = [CountriesSet]()
    
    init?(data: Data) {
        do {
             countries = try JSONDecoder().decode([CountriesSet].self, from: data)
            } catch {
            print("Error deserializing JSON: \(error)")
            return nil
        }
    }
}
