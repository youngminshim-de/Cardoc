//
//  UserListViewModel.swift
//  Cardoc
//
//  Created by 심영민 on 2021/11/10.
//

import Foundation
import RxSwift

class UserListViewModel {
    
    private let fetchUserListUseCase: FetchUserListUseCaseProtocol
    internal var userList: Observable<UserList>?
    
    init(with fetchUserListUseCase: FetchUserListUseCaseProtocol) {
        self.fetchUserListUseCase = fetchUserListUseCase
    }
    
    func excute(with query: [String: Any]? = nil) {
        userList = fetchUserListUseCase.execute(with: query)
    }
}
