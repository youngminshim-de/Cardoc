//
//  DetailUserUseCase.swift
//  Cardoc
//
//  Created by 심영민 on 2021/11/12.
//

import Foundation
import RxSwift

protocol FetchDetailUserUseCaseProtocol {
    func execute(with endPoint: String) -> Observable<DetailUser>
}

class FetchDetailUserUseCase: FetchDetailUserUseCaseProtocol {
    
    private let detailUserRepository: DetailUserRepositoryProtocol
    
    init(with detailUserRepository: DetailUserRepositoryProtocol) {
        self.detailUserRepository = detailUserRepository
    }
    
    func execute(with endPoint: String) -> Observable<DetailUser> {
        return detailUserRepository.fetch(with: endPoint)
    }
}
