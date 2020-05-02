//
//  DetailsViewModel.swift
//  Countries
//
//  Created by Prasad Patil on 4/29/20.
//  Copyright © 2020 Prasad Patil. All rights reserved.
//

import Foundation

class DetailsViewModel : NSObject {
    
    // MARK: - Properties
    var countryName : String = ""
    var capital : String = ""
    var callingCodes : String = ""
    var region : String = ""
    var subRegion : String = ""
    var timeZones : String = ""
    var currencies : String = ""
    var languages : String = ""
    
    init(set: CountriesSet) {
        super.init()
        if let countryName = set.name, let capital = set.capital, let region = set.region, let subRegion = set.subregion, let callingCodesArray = set.callingCodes, let timezonesArray = set.timezones {
            self.countryName = countryName
            self.capital = capital
            self.region = region
            self.subRegion = subRegion
            self.callingCodes = callingCodesArray.joined(separator: ", ")
            self.timeZones = timezonesArray.joined(separator: ", ")
            
            
            
        }
    }

}
