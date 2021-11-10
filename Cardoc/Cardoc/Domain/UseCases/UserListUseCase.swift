//
//  UserListUseCase.swift
//  Cardoc
//
//  Created by 심영민 on 2021/11/10.
//

import Foundation
import RxSwift

protocol FetchUserListUseCaseProtocol {
    func execute(with query: [String: Any]?) -> Observable<UserList>
}

class FetchUserListUseCase: FetchUserListUseCaseProtocol {
    
    private let userListRepository: UserListRepositoryProtocol
    
    init(with userListRepository: UserListRepositoryProtocol) {
        self.userListRepository = userListRepository
    }
    
    func execute(with query: [String : Any]?) -> Observable<UserList> {
        return userListRepository.fetch(with: query)
    }
}
