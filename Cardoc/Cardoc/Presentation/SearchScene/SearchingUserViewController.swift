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

class SearchingUserViewController: UIViewController, UISearchBarDelegate {

    private var searchController: UISearchController?
    private var searchBar: UISearchBar?
    @IBOutlet weak var userInformationTableView: UITableView!
    private var viewModel: UserListViewModel?
    weak var coordinator: AppFlowCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchController()
        setupNavigationItem()
        bindViewModel()
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
        self.navigationItem.backButtonTitle = "back"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = true
    }
    
    private func setupSearchController() {
        self.searchController = UISearchController()
        self.searchController?.searchBar.delegate = self
        self.searchController?.hidesNavigationBarDuringPresentation = true
        self.searchBar = self.searchController?.searchBar
    }

    
    private func bindViewModel() {
        viewModel?.userList
            .subscribe(onError: { [weak self] error in
                self?.coordinator?.presentAlertController(with: self, with: error)
            })
            .disposed(by: rx.disposeBag)
        
        viewModel?.userList
        .catchAndReturn([])
        .bind(to: userInformationTableView.rx.items(cellIdentifier: UserListCell.identifier, cellType: UserListCell.self)) { row, item, cell in
            cell.configure(with: item)
        }
        .disposed(by: rx.disposeBag)
                
        searchBar?.rx.searchButtonClicked
            .asDriver(onErrorJustReturn: ())
            .drive(onNext: { [weak self, weak searchBar] in
                guard let text = searchBar?.text else {
                    return
                }
                
                self?.viewModel?.fetchMoreDatas.onNext(text)
                searchBar?.resignFirstResponder()
            })
            .disposed(by: rx.disposeBag)
        
        searchBar?.rx.cancelButtonClicked
            .asDriver(onErrorJustReturn: ())
            .drive(onNext: { [weak self] _ in
                self?.viewModel?.fetchMoreDatas.onNext("")
            })
            .disposed(by: rx.disposeBag)
                
        userInformationTableView.rx.didScroll.subscribe { [weak self] _ in
            guard let self = self else {
                return
            }
            // 현재 스크롤의 위치
            let offsetY = self.userInformationTableView.contentOffset.y
            // 테이블뷰의 contentsize의 height
            let contentHeight = self.userInformationTableView.contentSize.height
            // 테이블뷰의 height
            let height = self.userInformationTableView.frame.height
            // 스크롤이 테이블 뷰의 끝(-100)에 가게 되면 다음페이지를 호출한다.
            if offsetY > (contentHeight - height - 100) {
                self.viewModel?.fetchMoreDatas.onNext(self.searchBar?.text ?? "")
            }
        }
        .disposed(by: rx.disposeBag)
        
        userInformationTableView.rx.modelSelected(Item.self)
            .subscribe { [weak self] item in
                self?.coordinator?.presentDetailUserViewController(with: item.element?.reposUrl ?? "" )
            }
            .disposed(by: rx.disposeBag)
    }
}
