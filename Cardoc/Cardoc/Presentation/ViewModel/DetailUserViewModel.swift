//
//  DetailUserViewModel.swift
//  Cardoc
//
//  Created by 심영민 on 2021/11/12.
//

import Foundation
import RxSwift

class DetailUserViewModel {
    private let fetchDetailUserUseCase: FetchDetailUserUseCaseProtocol
    private let endPoint: String
    
    internal var detailUser: Observable<DetailUser> {
        return fetchDetailUserUseCase.execute(with: endPoint)
    }
    
    init(with fetchDetailUserUseCase: FetchDetailUserUseCaseProtocol, with endPoint: String) {
        self.fetchDetailUserUseCase = fetchDetailUserUseCase
        self.endPoint = endPoint
    }
}
