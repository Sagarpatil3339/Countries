//
//  SearchViewTableViewCell.swift
//  Countries
//
//  Created by Prasad Patil on 4/30/20.
//  Copyright © 2020 Prasad Patil. All rights reserved.
//

import UIKit
import WebKit


class SearchViewTableViewCell: UITableViewCell {    
    @IBOutlet weak var flagImage: WKWebView!
    
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
        
        if let flag = item.flag {
            DispatchQueue.global(qos: .background).async {
                
                let endPoint = URL(string: flag)
                guard let endpointUrl = endPoint else {
                    return;
                }
                let request = URLRequest(url: endpointUrl);
                
                DispatchQueue.main.async {
                    self.flagImage.load(request)
                }
            }
        }
        
        self.flagImage.scalesLargeContentImage = true
        self.flagImage.contentMode = .center
    }
}
