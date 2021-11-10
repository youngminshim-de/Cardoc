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
    func fetch(with query: [String:Any]?) -> Observable<UserList>
}

class UserListRepository: UserListRepositoryProtocol {
    
    private let networkTask: Task<SearchingRequest, UserListDTO>
    
    init(with networkTask: Task<SearchingRequest, UserListDTO>) {
        self.networkTask = networkTask
    }
    
    func fetch(with query: [String:Any]? = nil) -> Observable<UserList> {
        return networkTask.fetch(SearchingRequest(path: EndPoint.mainURL.description,
                                                  httpMethod: .get, bodyParams: query, headers: nil), UserListDTO.self)
            .map{$0.toDomain()}
    }
}
