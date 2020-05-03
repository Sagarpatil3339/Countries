//
//  Constants.swift
//  Countries
//
//  Created by Prasad Patil on 4/29/20.
//  Copyright © 2020 Prasad Patil. All rights reserved.
//

import UIKit

/* Setting all the constants used in different classes and structures*/

class Constants {
    
    // MARK: - Singetons
    static let countriesAPI : String = "https://restcountries.eu/rest/v2/name/"
    static let SearchViewTableViewCellIdentifier : String = "SearchViewTableViewCell"
    static let searchViewTitle : String = "Countries"
    static let alertTitle : String = "Network Error"
    static let alertMessage : String = "Please turn on wifi/cellular services and restart the app"
    static let ok : String = "OK"
    static let back : String = "BACK"
    
    // Accessibility constants
    static let countryName : String = "countryName"
}
