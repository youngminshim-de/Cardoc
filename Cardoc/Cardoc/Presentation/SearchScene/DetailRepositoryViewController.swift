//
//  DetailRepositoryViewController.swift
//  Cardoc
//
//  Created by 심영민 on 2021/11/13.
//

import UIKit
import RxSwift
import MarkdownView

class DetailRepositoryViewController: UIViewController, CustomHeaderViewDelegate {

    @IBOutlet weak var headerView: DetailRepositoryHeaderView!
    @IBOutlet weak var readmeView: UIView!
    @IBOutlet weak var readmeHeightConstraint: NSLayoutConstraint!
    private var markdownView: MarkdownView = MarkdownView()
    
    weak var coordinator: AppFlowCoordinator?
    private var viewModel: ReadmeViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerView.delegate = self
        setupNavigationItem()
        setupMarkDownView()
        bindingViewModel()
    }
    
    static func create(with viewModel: ReadmeViewModel, with detailUser: DetailUser) -> DetailRepositoryViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "DetailRepositoryViewController") as? DetailRepositoryViewController else {
            return DetailRepositoryViewController()
        }
        viewController.viewModel = viewModel
        viewController.viewModel?.injectionDetailUser(with: detailUser)
        return viewController
    }
    
    func injectionCoordinator(with coordinator: AppFlowCoordinator) {
        self.coordinator = coordinator
    }
    
    private func setupNavigationItem() {
        self.navigationItem.title = ""
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    private func setupMarkDownView() {
        self.readmeView.addSubview(markdownView)
        markdownView.isScrollEnabled = false
        markdownView.translatesAutoresizingMaskIntoConstraints = false
        markdownView.leadingAnchor.constraint(equalTo: readmeView.leadingAnchor).isActive = true
        markdownView.topAnchor.constraint(equalTo: readmeView.topAnchor).isActive = true
        markdownView.trailingAnchor.constraint(equalTo: readmeView.trailingAnchor).isActive = true
        markdownView.bottomAnchor.constraint(equalTo: readmeView.bottomAnchor).isActive = true

        markdownView.onRendered = { [weak self] height in
            self?.readmeHeightConstraint.constant = height
        }
    }
    
    func bindingViewModel() {
        viewModel?.detailUser?
            .bind(onNext: { [weak self] detailUser in
                self?.headerView.configure(with: detailUser)
                
            })
            .disposed(by: rx.disposeBag)
        
        viewModel?.readme
            .subscribe(onNext: { [weak self ]readme in
                self?.markdownView.load(markdown: readme.content.decodedBase64String())
            }, onError: { error in
                print(error)
            })
            .disposed(by: rx.disposeBag)
    }
    
    func buttonTouched(with url: String) {
        self.coordinator?.showWebViewController(with: url)
    }
}
