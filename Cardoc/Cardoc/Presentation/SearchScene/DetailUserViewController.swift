//
//  DetailUserViewController.swift
//  Cardoc
//
//  Created by 심영민 on 2021/11/11.
//

import UIKit
import RxSwift
import RxCocoa
import RxGesture
import NSObject_Rx
import Kingfisher

class DetailUserViewController: UIViewController {

    @IBOutlet weak var repoListTableView: UITableView!
    weak var coordinator: AppFlowCoordinator?
    private var viewModel: DetailUserViewModel?
    private var avatarImageView = UIImageView()
    private var userNameLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindingViewModel()
    }
    
    static func create(with viewModel: DetailUserViewModel) -> DetailUserViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "DetailUserViewController") as? DetailUserViewController else {
            return DetailUserViewController()
        }
        
        viewController.viewModel = viewModel
        return viewController
    }
    
    internal func injectionCoordinator(with coordinator: AppFlowCoordinator) {
        self.coordinator = coordinator
    }
    
    private func bindingViewModel() {
        
        viewModel?.detailUser
            .subscribe(onError: { error in
                print(error)
            })
            .disposed(by: rx.disposeBag)
        
        viewModel?.detailUser
            .bind(to: repoListTableView.rx.items(cellIdentifier: DetailUserCell.identifier, cellType: DetailUserCell.self)) { [weak self] row, detailUser, cell in
                cell.configure(with: detailUser)
                self?.setUpTableHeaderView(with: detailUser.owner.avatarUrl, with: detailUser.owner.login)
            }
            .disposed(by: rx.disposeBag)
        
//        Observable.zip(avatarImageView.rx.tapGesture().asControlEvent(), userNameLabel.rx.tapGesture().asControlEvent())
//            .subscribe { [weak self] _ in
//                print(self?.viewModel?.detailUser.map{$0[0].htmlUrl})
//            }
//            .disposed(by: rx.disposeBag)
        
        avatarImageView.rx.tapGesture()
            .debug()
            .when(.recognized)
            .subscribe { [weak self] _ in

            }
            .disposed(by: rx.disposeBag)
        
        userNameLabel.rx.tapGesture()
            .when(.recognized)
            .subscribe {
                [weak self] _ in

            }
            .disposed(by: rx.disposeBag)
    }
    
    private func setUpTableHeaderView(with imageUrl: String, with name: String) {
        let headerView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: self.view.frame.width,
                                                                          height: self.repoListTableView.frame.height * 0.1)))
        
//        avatarImageView = UIImageView()
//        userNameLabel = UILabel()
        
        self.repoListTableView.tableHeaderView = headerView
        headerView.addSubview(avatarImageView)
        headerView.addSubview(userNameLabel)
        
        avatarImageView.load(url: imageUrl)
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        
        userNameLabel.text = name
        userNameLabel.font = .boldSystemFont(ofSize: 17)
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        avatarImageView.layer.cornerRadius = 30
        avatarImageView.layer.masksToBounds = true
        avatarImageView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16).isActive = true
        avatarImageView.centerYAnchor.constraint(equalTo: headerView.centerYAnchor).isActive = true
        avatarImageView.heightAnchor.constraint(equalTo: headerView.heightAnchor, multiplier: 0.8).isActive = true
        avatarImageView.widthAnchor.constraint(equalTo: avatarImageView.heightAnchor).isActive = true
        
        userNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 8).isActive = true
        userNameLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor).isActive = true
        userNameLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
    }
}
