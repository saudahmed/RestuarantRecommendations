//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by Simon Ng on 24/8/2017.
//  Copyright © 2017 AppCoda. All rights reserved.
//

import UIKit
import CoreData
import UserNotifications

class RestaurantTableViewController: UITableViewController, NSFetchedResultsControllerDelegate, UISearchResultsUpdating {

    // MARK: - Properties
    
    @IBOutlet var emptyRestaurantView: UIView!
    
    var searchController: UISearchController!
    
    // MARK: - View controller life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.cellLayoutMarginsFollowReadableWidth = true
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Configure navigation bar appearance
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        if let customFont = UIFont(name: "Rubik-Medium", size: 40.0) {
            navigationController?.navigationBar.largeTitleTextAttributes = [ NSAttributedStringKey.foregroundColor: UIColor(red: 231, green: 76, blue: 60), NSAttributedStringKey.font: customFont ]
        }

        navigationController?.hidesBarsOnSwipe = true
        
        // Prepare the empty view
        tableView.backgroundView = emptyRestaurantView
        tableView.backgroundView?.isHidden = true
        
        // Adding a search bar
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = NSLocalizedString("Search restaurants...", comment: "Search restaurants...")
        searchController.searchBar.barTintColor = .white
        searchController.searchBar.backgroundImage = UIImage()
        searchController.searchBar.tintColor = UIColor(red: 231, green: 76, blue: 60)
        tableView.tableHeaderView = searchController.searchBar
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = true
    }

    override func viewDidAppear(_ animated: Bool) {

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - UITableViewDataSource Protocol

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantTableViewCell
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if searchController.isActive {
            return false
        } else {
            return true
        }
    }

    
    // MARK: - Helper methods
    
    func filterContent(for searchText: String) {

    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            filterContent(for: searchText)
            tableView.reloadData()
        }
    }
}

