//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, FilterViewControllerDelegate, UISearchBarDelegate {

    @IBOutlet weak var tableView: UITableView!
    var searchBar: UISearchBar!
    
    var businesses: [Business]!
    
    var searchActive: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        searchBar = UISearchBar()
        searchBar!.sizeToFit()
        navigationItem.titleView = searchBar
        searchBar.delegate = self
       
        
        Business.searchWithTerm("Restaurants", completion: { (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = businesses
            self.tableView.reloadData()
            self.tableView.rowHeight = UITableViewAutomaticDimension
            self.tableView.estimatedRowHeight = 200
            
            
//            for business in businesses {
//                print(business.name!)
//                print(business.address!)
//            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (businesses != nil) {
            return businesses!.count
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("BusinessCell", forIndexPath: indexPath) as! BusinessViewCell
        cell.business = businesses[indexPath.row]
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.searchBar.resignFirstResponder()
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        searchActive = true
    }
    
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
//        filtered = data.filter({ (text) -> Bool in
//            let tmp: NSString = text
//            let range = tmp.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
//            return range.location != NSNotFound
//        })
        
        Business.searchWithTerm(searchText, sort: nil, categories: nil, deals: nil, radius:nil) { (businesses: [Business]!, error: NSError!) -> Void in
            print("these are the /(businesses) chosen ones")
            self.businesses = businesses
            self.tableView.reloadData()
        }

        if(self.businesses.count == 0){
            searchActive = false;
        } else {
            searchActive = true;
        }
        self.tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let navigationController = segue.destinationViewController as! UINavigationController
        let filterViewController = navigationController.topViewController as! FilterViewController
        
        filterViewController.delegate = self
    }
    
    func filterViewController(filterViewController: FilterViewController, didUpdateFilters filters: [String : AnyObject]) {
        
        let categories = filters["categories"] as? [String]
        
        let deals = filters["deals"] as? Bool
        
        let rawVal = filters["sortBy"] as? Int
        let sort = YelpSortMode(rawValue:rawVal!)
        print(sort)
        
        let radiusIndex = filters["distance"] as? Int
        
        var radius : Float = 0.3
        if radiusIndex == 0 {
            radius = 0.3
        } else if radiusIndex == 1 {
            radius = 1
        } else if radiusIndex == 2 {
            radius = 5
        } else {
            radius = 10
        }
        
        Business.searchWithTerm("Restaurants", sort: sort, categories: categories, deals: deals, radius: radius) { (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = businesses
            self.tableView.reloadData()
        }
        
    }

}
