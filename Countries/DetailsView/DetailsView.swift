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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
