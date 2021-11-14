//
//  AppFlowCoordinator.swift
//  Cardoc
//
//  Created by 심영민 on 2021/11/10.
//

import Foundation
import UIKit

protocol AppFlowCoordinatorDependencies {
    func makeSearchingUserViewController() -> SearchingUserViewController
    func makeDetailUserViewController(with endPoint: String) -> DetailUserViewController
    func makeWebViewController(with url: String) -> WebViewController
    func makeDetailRepositoryViewController(with detailUser: DetailUser) -> DetailRepositoryViewController
}

protocol Coordinator {
    var rootViewController: UINavigationController { get }
}

class AppFlowCoordinator: Coordinator {
    var rootViewController: UINavigationController
    private let dependencies: AppFlowCoordinatorDependencies
    
    init(with rootViewController: UINavigationController, with dependencies: AppFlowCoordinatorDependencies) {
        self.rootViewController = rootViewController
        self.dependencies = dependencies
    }
    
    func presentDetailUserViewController(with endPoint: String) {
        let detailUserViewController = dependencies.makeDetailUserViewController(with: endPoint)
        detailUserViewController.injectionCoordinator(with: self)
        self.rootViewController.present(detailUserViewController, animated: true, completion: nil)
    }
    
    func showDetailRepositoryViewController(with detailUser: DetailUser) {
        let detailRepositoryViewController = dependencies.makeDetailRepositoryViewController(with: detailUser)
        detailRepositoryViewController.injectionCoordinator(with: self)
        self.rootViewController.pushViewController(detailRepositoryViewController, animated: true)
    }
    
    func showWebViewController(with url: String) {
        let webViewController = dependencies.makeWebViewController(with: url)
        self.rootViewController.pushViewController(webViewController, animated: true)
    }
}
