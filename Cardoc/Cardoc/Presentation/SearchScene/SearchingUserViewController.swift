//
//  ViewController.swift
//  Cardoc
//
//  Created by 심영민 on 2021/11/10.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx
import Alamofire

class SearchingUserViewController: UIViewController {

    private var searchController: UISearchController?
    @IBOutlet weak var userInformationTableView: UITableView!
    private var viewModel: UserListViewModel?
    weak var coordinator: AppFlowCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchController()
        setupNavigationItem()
        let networkTask: NetworkTask<SearchingRequest, UserListDTO> = NetworkTask(with: SearchingDispatcher(with: AF), with: JSONDecoder(), with: .convertFromSnakeCase)
        viewModel = UserListViewModel(with: FetchUserListUseCase(with: UserListRepository(with: networkTask)))
    }
    
    static func create(with viewModel: UserListViewModel) -> SearchingUserViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "SearchingUserViewController") as? SearchingUserViewController else {
            return SearchingUserViewController()
        }
        viewController.viewModel = viewModel
        return viewController
    }
    
    func injectionCoordinator(with coordinator: AppFlowCoordinator) {
        self.coordinator = coordinator
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

    
    func bindViewModel(with query: [String:Any]?) {
        
        viewModel?.excute(with: query)
            .subscribe(onError: { error in
                print(error)
            })
            .disposed(by: rx.disposeBag)
        
        viewModel?.excute(with: query).map{$0.items}
        .debug()
        .bind(to: userInformationTableView.rx.items(cellIdentifier: UserListCell.identifier, cellType: UserListCell.self)) { row, item, cell in
            cell.configure(with: item)
        }
        .disposed(by: rx.disposeBag)
    }
}



extension SearchingUserViewController: UISearchBarDelegate {    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let query = ["q" : searchBar.text!]
        bindViewModel(with: query)
    }
}
