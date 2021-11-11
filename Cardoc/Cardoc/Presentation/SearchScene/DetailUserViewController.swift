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
    
    func injectionCoordinator(with coordinator: AppFlowCoordinator) {
        self.coordinator = coordinator
    }
}
