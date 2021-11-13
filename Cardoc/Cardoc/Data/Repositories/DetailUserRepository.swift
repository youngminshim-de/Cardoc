//
//  DetailUserRepository.swift
//  Cardoc
//
//  Created by 심영민 on 2021/11/12.
//

import Foundation
import Alamofire
import RxSwift

protocol DetailUserRepositoryProtocol {
    func fetch(with endPoint: String) -> Observable<[DetailUser]>
}

class DetailUserRepository: DetailUserRepositoryProtocol {
    
    private let networkTask: Task<SearchingRequest, [DetailUserDTO]>
    
    init(with networkTask: Task<SearchingRequest, [DetailUserDTO]>) {
        self.networkTask = networkTask
    }
    
    func fetch(with endPoint: String) -> Observable<[DetailUser]> {
        return networkTask.fetch(SearchingRequest(path: endPoint,
                                                  httpMethod: .get, bodyParams: nil, headers: nil), [DetailUserDTO].self)
            .map{$0.map{$0.toDomain()}}
    }
}
