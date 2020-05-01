//
//  SearchView.swift
//  Countries
//
//  Created by Prasad Patil on 4/29/20.
//  Copyright © 2020 Prasad Patil. All rights reserved.
//

import UIKit

class SearchView: UIViewController, UITableViewDelegate, UISearchResultsUpdating {
    
    let viewModel = SearchViewModel(dataService: DataService())
    let searchController = UISearchController(searchResultsController: nil)

    func updateSearchResults(for searchController: UISearchController) {
        viewModel.networkCall() { (refresh)  in
            if refresh {
                self.updateUI()
            } else {
                AlertView.configureAlert(viewController: self)
            }
        }
    }
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        tableView.dataSource = viewModel
        super.viewDidLoad()
        setTitles()
        setTable()
        setSearchBar()
    }
    
    
    func setTitles() {
        title = Constants.searchViewTitle
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: Constants.back, style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.accessibilityIdentifier = Constants.back

    }
    
    func setTable() {
        tableView.separatorColor = .black
        tableView.rowHeight = 100
        setTitles()
    }

    func setSearchBar() {
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.sizeToFit()
        self.tableView.tableHeaderView = searchController.searchBar
    }
    
    func updateUI() {
        DispatchQueue.main.async {
            self.tableView.reloadData();
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchViewTableViewCell", for: indexPath) as! SearchViewTableViewCell
        return cell
    }
}

// MARK: - Table Delegate protocal stubs

extension EarthquakeTableView : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsViewController = DetailsView()
                if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.SearchViewTableViewCellIdentifier, for: indexPath) as? SearchViewTableViewCell {
                        return cell
                    }
        navigationController?.pushViewController(detailsViewController, animated: true)
    }
}
