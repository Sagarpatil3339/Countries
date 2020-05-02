//
//  DetailsView.swift
//  Countries
//
//  Created by Prasad Patil on 4/29/20.
//  Copyright © 2020 Prasad Patil. All rights reserved.
//

import UIKit

class DetailsView: UIViewController {

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
        setViews()
    }
    
    func setViews(){
        if let detailsViewModel = detailsViewModel {
            countryName.text = detailsViewModel.countryName
            capitol.text = detailsViewModel.capital
        }
    }
}
