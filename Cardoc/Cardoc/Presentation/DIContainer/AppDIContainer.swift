//
//  AppDIContainer.swift
//  Cardoc
//
//  Created by 심영민 on 2021/11/10.
//

import Foundation
import Alamofire

class AppDiContainer: AppFlowCoordinatorDependencies {
    var apiNetworkService: NetworkTask<SearchingRequest, UserListDTO> = NetworkTask(with: SearchingDispatcher(with: AF), with: JSONDecoder(), with: .convertFromSnakeCase)
    
    struct Dependencies {
        let searchingUserTask: Task<SearchingRequest, UserListDTO>
    }
    
    private let dependencies: Dependencies
    
    init(with dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func makeUserListRepository() -> UserListRepositoryProtocol {
        return UserListRepository(with: dependencies.searchingUserTask)
    }
    
    func makeUserListUseCase() -> FetchUserListUseCaseProtocol {
        return FetchUserListUseCase(with: makeUserListRepository())
    }
    
    func makeUserListViewModel() -> UserListViewModel {
        return UserListViewModel(with: makeUserListUseCase())
    }
    
    func makeSearchingUserViewController() -> SearchingUserViewController {
        return SearchingUserViewController.create(with: makeUserListViewModel())
    }
    
    func makeAppFlowCoordinator(with navigationController: UINavigationController) -> AppFlowCoordinator {
        return AppFlowCoordinator(with: navigationController, with: self)
    }
}