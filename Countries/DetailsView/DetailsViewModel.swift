//
//  DetailsViewModel.swift
//  Countries
//
//  Created by Prasad Patil on 4/29/20.
//  Copyright © 2020 Prasad Patil. All rights reserved.
//

import Foundation
import UIKit

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
    var flagImage : UIImage = UIImage()
    
    init(set: CountriesSet) {
        super.init()
        setProperties(set: set)
    }
    
    // MARK:- Methods
    
    func setProperties(set: CountriesSet) {
        if let countryName = set.name, let capital = set.capital, let region = set.region, let subRegion = set.subregion, let callingCodesArray = set.callingCodes, let timezonesArray = set.timezones, let currenciesArray = set.currencies, let languagesArray = set.languages {
            self.countryName = countryName
            self.capital = capital
            self.region = region
            self.subRegion = subRegion
            self.callingCodes = callingCodesArray.joined(separator: ", ")
            self.timeZones = timezonesArray.joined(separator: ", ")
            
            for each in currenciesArray {
                if let code = each["code"] as? String, let name = each["name"] as? String, let symbol = each["symbol"] as? String {
                    self.currencies = self.currencies + "currency name: \(name) | currency Code: \(code) | currency Symbol: \(symbol) \n"
                }
            }
            
            for each in languagesArray {
                if let language = each["name"] as? String {
                    self.languages = self.languages + language + ", "
                }
            }
            
            // Inorder to remove ", " from the end of the string after all the iterations
            self.languages.removeLast(2)
        }
            // Service call for downloading the images via URL
            if let flagURL = set.flag {
                DataService().downloadImage(url: flagURL, completion: { (image, error) in
                    if let error = error {
                        print("loading image error: \(error)")
                    } else {
                        if let image = image {
                            self.flagImage = image
                        }
                    }
                })
            }
        }
    }
