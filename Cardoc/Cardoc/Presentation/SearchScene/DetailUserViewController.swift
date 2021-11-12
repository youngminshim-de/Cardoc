//
//  DetailUserViewController.swift
//  Cardoc
//
//  Created by 심영민 on 2021/11/11.
//

import UIKit

class DetailUserViewController: UIViewController {

    @IBOutlet weak var repoListTableView: UITableView!
    weak var coordinator: AppFlowCoordinator?
    private var viewModel: DetailUserViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindingViewModel()
    }
    
    override func viewDidLayoutSubviews() {
        repoListTableView.tableHeaderView = makeTableHeaderView()
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
            }
            .disposed(by: rx.disposeBag)
    }
    
    private func makeTableHeaderView() -> UIView {
        let headerView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: self.view.frame.width, height: 64)))
        let imageView = UIImageView(frame: CGRect(origin: CGPoint(x: 16, y: 8), size: CGSize(width: 48, height: 48)))
        
        imageView.image = UIImage(systemName: "trash")
        let label = UILabel()
        
//        imageView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16).isActive = true
//        imageView.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 8).isActive = true
//        imageView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 8).isActive = true
//        imageView.trailingAnchor.constraint(equalTo: label.leadingAnchor, constant: 8).isActive = true
        
        headerView.addSubview(imageView)
        
//        label.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -8).isActive = true
//        label.topAnchor.constraint(equalTo: imageView.topAnchor).isActive = true
//        label.bottomAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
//        label.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        
        headerView.addSubview(label)
        return headerView
    }
}
