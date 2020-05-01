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
    
    var longitude : Double = 0.0
    var latitude : Double = 0.0
    var center : CLLocationCoordinate2D = CLLocationCoordinate2D()
    
    init(set: Earthquakes) {
        super.init()
        if let longitude = set.longitude, let latitude = set.latitude {
            self.longitude = longitude
            self.latitude = latitude
        }
        center = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    // MARK: - Methods
}
