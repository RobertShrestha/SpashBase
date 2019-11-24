//
//  ListViewViewController.swift
//  SplashBase
//
//  Created by Robert Shrestha on 11/23/19.
//Copyright © 2019 robert. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            self.tableView.delegate = self
            self.tableView.dataSource = self
            self.tableView.rowHeight = UITableView.automaticDimension
            self.tableView.estimatedRowHeight = 44.0
            self.tableView.separatorColor = .clear
        }
    }
    
    @IBOutlet weak var searchBar:UISearchBar!{
        didSet{
            self.searchBar.placeholder = "Test Me 😀"
            searchBar.delegate = self
        }
    }
    
    
    let searchController = UISearchController(searchResultsController: nil)
    var viewModel = ListViewModel()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Here")
       
       
        
        getImages()
        /// Below code for hidding the search bar when the view first loads up
        let searchBarHeight = searchBar.frame.size.height
        tableView.setContentOffset(CGPoint(x: 0, y: searchBarHeight), animated: false)
        
         self.title = "Home"
        
        /// Below code to hide search bar when scrolling
        
        if #available(iOS 11.0, *) {
            navigationItem.hidesSearchBarWhenScrolling = true
        } else {
            tableView.tableHeaderView = searchController.searchBar
        }
        
        
    }
    
   
    

    
   
    
    fileprivate func getImages() {
        viewModel.getList(completionHandler: { result in
            switch result{
                
            case .success(let status):
                switch status{
                    
                case true:
                    self.refreshTable()
                case false:
                    self.showAlert(title: "Something Went Wrong!", message: "No data")
                }
            case .failure(let error):
                print(error)
                self.showAlert(title: "Error", message: error.localizedDescription)
            }
        })
    }
    
    fileprivate func getSearchImages(queryString:String) {
        viewModel.getSearchList(queryString:queryString,completionHandler: { result in
            switch result{
                
            case .success(let status):
                switch status{
                    
                case true:
                    self.refreshTable()
                case false:
                    self.showAlert(title: "Something Went Wrong!", message: "No data")
                }
            case .failure(let error):
                print(error)
                self.showAlert(title: "Error", message: error.localizedDescription)
            }
        })
    }
    
    fileprivate func refreshTable() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
    deinit {
        print("List View Removed")
    }
    
    
    
    
    
}

extension ListViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.listCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueResuableCell(forIndexPath: indexPath) as ListTableViewCell
        return self.viewModel.configureImageCel(cell: cell, atIndex: indexPath)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel.pushToDetailView(navigationController: self.navigationController!, indexPath: indexPath)
    }
    
    
}
extension ListViewController:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(self.reload(_:)), object: searchBar)
        perform(#selector(self.reload(_:)), with: searchBar, afterDelay: 0.75)
    }
    
    @objc func reload(_ searchBar: UISearchBar) {
        guard let query = searchBar.text, query.trimmingCharacters(in: .whitespaces) != "" else {
            print("nothing to search")
            viewModel.isFiltered = false
            refreshTable()
            return
        }
        viewModel.isFiltered = true
        self.getSearchImages(queryString: query)
    }
}
