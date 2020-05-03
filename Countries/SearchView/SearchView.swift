//
//  SearchView.swift
//  Countries
//
//  Created by Prasad Patil on 4/29/20.
//  Copyright © 2020 Prasad Patil. All rights reserved.
//

import UIKit

class SearchView: UIViewController, UISearchResultsUpdating {
    
    // MARK:- Properties
    
    let viewModel = SearchViewModel(dataService: DataService())
    let searchController = UISearchController(searchResultsController: nil)
    
    func updateSearchResults(for searchController: UISearchController) {
        
        if let searchString = searchController.searchBar.text
        {
            viewModel.networkCall(searchString: searchString) { (refresh)  in
                if refresh {
                    self.updateUI()
                } else {
                    AlertView.configureAlert(viewController: self)
                }
            }
        }
    }
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = viewModel
        searchController.accessibilityTraits = UIAccessibilityTraits.searchField
        navigationItem.backBarButtonItem?.accessibilityIdentifier = "BACK"
        setTitles()
        setTable()
        setSearchBar()
    }
    
    // MARK:- Methods
    
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
        viewModel.delayExecutionByMilliseconds(500) {
            DispatchQueue.main.async {
                self.tableView.reloadData();
            }
        }
    }
    
    // Preparing segue in order to load data in the view model before navigating to the detail view screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailViewID", let indexPath = tableView.indexPathForSelectedRow?.row {
            let detailsViewController = segue.destination as! DetailsView
            if let set = viewModel.items?[indexPath] {
                detailsViewController.detailsViewModel = DetailsViewModel(set: set)
            }
        }
    }
}
