//
//  UserListRepository.swift
//  Cardoc
//
//  Created by 심영민 on 2021/11/10.
//

import Foundation
import Alamofire
import RxSwift

protocol UserListRepositoryProtocol {
    func fetch() -> Observable<UserList>
}

class UserListRepository: UserListRepositoryProtocol {
    
    private let networkTask: Task<Request
    func fetch() -> Observable<UserList> {
        <#code#>
    }
    
    
}
