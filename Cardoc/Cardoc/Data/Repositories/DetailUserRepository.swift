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
    func fetch(with query: [String:Any]?) -> Observable<DetailUser>
}

class DetailUserRepository: DetailUserRepositoryProtocol {
    
    private let networkTask: Task<SearchingRequest, DetailUserDTO>
    
    init(with networkTask: Task<SearchingRequest, DetailUserDTO>) {
        self.networkTask = networkTask
    }
    
    func fetch(with query: [String:Any]? = nil) -> Observable<DetailUser> {
        return networkTask.fetch(SearchingRequest(path: EndPoint.searchingUserURL.description,
                                                  httpMethod: .get, bodyParams: query, headers: nil), DetailUserDTO.self)
            .map{$0.toDomain()}
    }
}
