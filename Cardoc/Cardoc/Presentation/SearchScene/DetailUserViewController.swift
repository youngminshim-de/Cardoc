//
//  DetailUserViewController.swift
//  Cardoc
//
//  Created by 심영민 on 2021/11/11.
//

import UIKit
import Kingfisher

class DetailUserViewController: UIViewController {

    @IBOutlet weak var repoListTableView: UITableView!
    weak var coordinator: AppFlowCoordinator?
    private var viewModel: DetailUserViewModel?
    
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
            .bind(to: repoListTableView.rx.items(cellIdentifier: DetailUserCell.identifier, cellType: DetailUserCell.self)) { row, detailUser, cell in
                cell.configure(with: detailUser)
                self.setUpTableHeaderView(with: detailUser.owner.avatarUrl, with: detailUser.owner.login)
            }
            .disposed(by: rx.disposeBag)
    }
    
    private func setUpTableHeaderView(with imageUrl: String, with name: String) {
        let headerView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: self.view.frame.width,
                                                                          height: self.repoListTableView.frame.height * 0.1)))
        
        let imageView = UIImageView()
        imageView.load(url: imageUrl)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let label = UILabel()
        label.text = name
        label.translatesAutoresizingMaskIntoConstraints = false
        
        self.repoListTableView.tableHeaderView = headerView
        headerView.addSubview(imageView)
        headerView.addSubview(label)
        
        imageView.layer.cornerRadius = 30
        imageView.layer.masksToBounds = true
        imageView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16).isActive = true
        imageView.centerYAnchor.constraint(equalTo: headerView.centerYAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: headerView.heightAnchor, multiplier: 0.8).isActive = true
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor).isActive = true

        label.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 8).isActive = true
        label.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
    }
}
