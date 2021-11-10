//
//  ViewController.swift
//  Cardoc
//
//  Created by 심영민 on 2021/11/10.
//

import UIKit

class SearchingUserViewController: UIViewController, UISearchBarDelegate {

    private var searchController: UISearchController?
    @IBOutlet weak var userInformationTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchController()
        setupNavigationItem()
    }
    
    private func setupNavigationItem() {
        self.navigationItem.title = "github"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = true
    }
    
    private func setupSearchController() {
        self.searchController = UISearchController()
        self.searchController?.searchBar.delegate = self
        self.searchController?.hidesNavigationBarDuringPresentation = true
    }
}

extension SearchingUserViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
