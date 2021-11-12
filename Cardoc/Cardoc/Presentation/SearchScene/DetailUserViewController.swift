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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        repoListTableView.tableHeaderView = makeTableHeaderView()
    }
    
    func injectionCoordinator(with coordinator: AppFlowCoordinator) {
        self.coordinator = coordinator
    }
    
    func makeTableHeaderView() -> UIView {
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

extension DetailUserViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailUserCell.identifier) as? DetailUserCell else {
            return DetailUserCell()
        }
        return cell
    }
}
