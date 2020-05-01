//
//  SearchView.swift
//  Countries
//
//  Created by Prasad Patil on 4/29/20.
//  Copyright © 2020 Prasad Patil. All rights reserved.
//

import UIKit

class SearchView: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {
    
    let searchController = UISearchController(searchResultsController: nil)

    
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.sizeToFit()
        self.tableView.tableHeaderView = searchController.searchBar

        title = "Countries"
        super.viewDidLoad()
        tableView.separatorColor = .black
        tableView.rowHeight = 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchViewTableViewCell", for: indexPath) as! SearchViewTableViewCell
        return cell
    }
}
