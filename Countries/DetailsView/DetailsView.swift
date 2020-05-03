//
//  DetailsView.swift
//  Countries
//
//  Created by Prasad Patil on 4/29/20.
//  Copyright © 2020 Prasad Patil. All rights reserved.
//

import UIKit

class DetailsView: UIViewController {

    // MARK:- Properties

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var insideView: UIView!
    
    @IBOutlet weak var flagImage: UIImageView!
    
    @IBOutlet weak var countryName: UILabel!
    
    @IBOutlet weak var capitol: UILabel!
    
    @IBOutlet weak var callingCode: UILabel!
    
    @IBOutlet weak var region: UILabel!
    
    @IBOutlet weak var subRegion: UILabel!
    
    @IBOutlet weak var timeZone: UILabel!
    
    @IBOutlet weak var currencies: UILabel!
    
    @IBOutlet weak var languages: UILabel!
    
    var detailsViewModel : DetailsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Details"
        setViews()
        flagImage.layer.borderColor = UIColor.white.cgColor
        flagImage.layer.borderWidth = 2
    }

    // MARK:- Methods

    func setViews(){
        if let detailsViewModel = detailsViewModel {
            countryName.text = detailsViewModel.countryName
            capitol.text = "Capitol: \(detailsViewModel.capital)"
            flagImage.image = detailsViewModel.flagImage
            region.text = "Region: \(detailsViewModel.region)"
            callingCode.text = "Calling Codes: \(detailsViewModel.callingCodes)"
            timeZone.text = "Time Zones: \(detailsViewModel.timeZones)"
            currencies.text = "Currencies:- \(detailsViewModel.currencies)"
            languages.text = "Languages: \(detailsViewModel.languages)"
            subRegion.text = "Subregion: \(detailsViewModel.subRegion)"
        }
    }
}
