//
//  SearchViewModel.swift
//  Countries
//
//  Created by Prasad Patil on 4/29/20.
//  Copyright © 2020 Prasad Patil. All rights reserved.
//

import Foundation
import UIKit

/*  */

class SearchViewModel: NSObject {
    // MARK: - Properties
    
    var items : [CountriesSet]?
    
    private var dataService: DataService?
    
    init(dataService: DataService) {
        super.init()
        self.dataService = dataService
    }

    // MARK: - Methods

    // Initial network call for fetching json and modeling
    
    func networkCall(searchString : String, completionHandler: @escaping (_ refresh : Bool) -> ()) {
        
        let endPoint : String = Constants.countriesAPI + searchString
        
        guard  let endpointUrl = URL(string: endPoint) else {
            return;
        }
        let request = URLRequest(url: endpointUrl);
        
        self.dataService?.httpResponse(request: request) { (received_data, error) in

            if let error = error {
                print(error)
                completionHandler(false)
            }
            guard let successData = received_data, let dataModel = DataModel(data: successData) else{
                return
            }
            let countries = dataModel.countries
            if !countries.isEmpty {
                self.items = countries
            }
            completionHandler(true);
        }
    }
    
     func delayExecutionByMilliseconds(_ delay: Int, completionHandler: @escaping () -> Void) {
        let when = DispatchTime.now() + .milliseconds(delay)
        DispatchQueue.main.asyncAfter(deadline: when, execute: completionHandler)
    }
}

// MARK: - Table datasource protocal stubs

extension SearchViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.SearchViewTableViewCellIdentifier, for: indexPath) as? SearchViewTableViewCell, let item = items?[indexPath.row] {
            cell.setCell(item: item)
                return cell
            }
        return UITableViewCell()
    }
}
