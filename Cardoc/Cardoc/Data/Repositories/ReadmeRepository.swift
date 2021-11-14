//
//  ReadmeRepository.swift
//  Cardoc
//
//  Created by 심영민 on 2021/11/13.
//

import Foundation
import Alamofire
import RxSwift

protocol ReadmeRepositoryProtocol {
    func fetch(with endPoint: String) -> Observable<Readme>
}

class ReadmeRepository: ReadmeRepositoryProtocol {
    
    private let networkTask: Task<SearchingRequest, ReadmeDTO>
    
    init(with networkTask: Task<SearchingRequest, ReadmeDTO>) {
        self.networkTask = networkTask
    }
    
    func fetch(with endPoint: String) -> Observable<Readme> {
        return networkTask.fetch(SearchingRequest(path: endPoint,
                                                  httpMethod: .get, bodyParams: nil, headers: nil), ReadmeDTO.self)
            .map{$0.todomain()}
    }
}
