//
//  SceneDelegate.swift
//  Cardoc
//
//  Created by 심영민 on 2021/11/10.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private let appDIContainer = AppDiContainer()
    private var flowCoordinator: AppFlowCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let searchingUserViewController = appDIContainer.makeSearchingUserViewController()
        let rootViewController = UINavigationController(rootViewController: searchingUserViewController)
        flowCoordinator = AppFlowCoordinator(with: rootViewController, with: appDIContainer)
        searchingUserViewController.injectionCoordinator(with: flowCoordinator!)
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
    }
}

