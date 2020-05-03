//
//  CountriesSet.swift
//  Countries
//
//  Created by Prasad Patil on 4/29/20.
//  Copyright © 2020 Prasad Patil. All rights reserved.
//

/* Structuring data for each instace of JSON Array with CODABLE Protocol*/

import UIKit

struct CountriesSet : Codable {
    var name : String?
    var topLevelDomain : [String]?
    var alpha2Code : String?
    var alpha3Code : String?
    var callingCodes : [String]?
    var capital : String?
    var altSpellings : [String]?
    var region : String?
    var subregion : String?
    var population : Int?
    var latlng : [Double]?
    var demonym : String?
    var area : Double?
    var gini : Double?
    var timezones : [String]?
    var borders : [String]?
    var nativeName : String?
    var numericCode : String?
    var currencies : [[String : String?]]?
    var languages : [[String : String?]]?
    var translations : [String : String?]?
    var flag : String?
    var regionalBlocs : [RegionalBlocs]?
    var cioc : String?
}

struct RegionalBlocs : Codable {
    var acronym : String?
    var name : String?
    var otherAcronyms : [String]?
    var otherNames : [String]?
}
