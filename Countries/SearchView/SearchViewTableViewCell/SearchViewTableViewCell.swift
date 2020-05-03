//
//  SearchViewTableViewCell.swift
//  Countries
//
//  Created by Prasad Patil on 4/30/20.
//  Copyright © 2020 Prasad Patil. All rights reserved.
//

import UIKit

class SearchViewTableViewCell: UITableViewCell {
    @IBOutlet weak var countryImage: UIImageView!
    
    @IBOutlet weak var countryName: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
    }
    
    
    func setCell(item : CountriesSet){
        
        countryName.text = item.name
        
        if let flagURL = item.flag {
            DataService().downloadImage(url: flagURL, completion: { (image, error) in
                if let error = error {
                    print("loading image error: \(error)")
                } else {
                    self.countryImage.image = image
                }
            })
        }
        
    }
}
