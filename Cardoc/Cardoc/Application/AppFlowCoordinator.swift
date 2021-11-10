//
//  AppFlowCoordinator.swift
//  Cardoc
//
//  Created by 심영민 on 2021/11/10.
//

import Foundation
import UIKit

protocol Coordinator {
    var rootViewController: UINavigationController { get }
    func start()
}

class AppFlowCoordinator: Coordinator {
    var rootViewController: UINavigationController
    
    init(with rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }
    
    func start() {
        
    }
}
