//
//  AppDIContainer.swift
//  Cardoc
//
//  Created by 심영민 on 2021/11/10.
//

import Foundation
import Alamofire

final class AppDiContainer: AppFlowCoordinatorDependencies {
    var searchUserNetworkService: NetworkTask<SearchingRequest, UserListDTO> = NetworkTask(with: SearchingDispatcher(with: AF), with: JSONDecoder(), with: .convertFromSnakeCase)
    
    var detailUserNetworkService: NetworkTask<SearchingRequest, [DetailUserDTO]> = NetworkTask(with: SearchingDispatcher(with: AF), with: JSONDecoder(), with: .convertFromSnakeCase)
    
    var readmeNetworkService: NetworkTask<SearchingRequest, ReadmeDTO> = NetworkTask(with: SearchingDispatcher(with: AF), with: JSONDecoder(), with: .convertFromSnakeCase)
    
    struct Dependencies {
        let searchingUserTask: Task<SearchingRequest, UserListDTO>
        let detailUserTask: Task<SearchingRequest, [DetailUserDTO]>
        let readmeTask: Task<SearchingRequest, ReadmeDTO>
    }
    
    private let dependencies: Dependencies
    
    init() {
        self.dependencies = Dependencies(searchingUserTask: searchUserNetworkService, detailUserTask: detailUserNetworkService,
        readmeTask: readmeNetworkService)
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

extension AppDiContainer {
    func makeDetailUserRepository() -> DetailUserRepositoryProtocol {
        return DetailUserRepository(with: dependencies.detailUserTask)
    }
    
    func makeDetailUserUseCase() -> FetchDetailUserUseCaseProtocol {
        return FetchDetailUserUseCase(with: makeDetailUserRepository())
    }
    
    func makeDetailUserViewModel(with endPoint: String) -> DetailUserViewModel {
        return DetailUserViewModel(with: makeDetailUserUseCase(), with: endPoint)
    }
    
    func makeDetailUserViewController(with endPoint: String) -> DetailUserViewController {
        return DetailUserViewController.create(with: makeDetailUserViewModel(with: endPoint))
    }
}

extension AppDiContainer {
    func makeReadmeRepository() -> ReadmeRepositoryProtocol {
        return ReadmeRepository(with: dependencies.readmeTask)
    }
    
    func makeReadmeUseCase() -> ReadmeUseCaseProtocol {
        return ReadmeUseCase(with: makeReadmeRepository())
    }
    
    func makeReadmeViewModel() -> ReadmeViewModel {
        return ReadmeViewModel(with: makeReadmeUseCase())
    }
    
    func makeDetailRepositoryViewController(with detailUser: DetailUser) -> DetailRepositoryViewController {
        return DetailRepositoryViewController.create(with: makeReadmeViewModel(), with: detailUser)
    }
}

extension AppDiContainer {
    func makeWebViewController(with url: String) -> WebViewController {
        return WebViewController.create(with: url)
    }
}

