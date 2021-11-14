//
//  ReadmeViewModel.swift
//  Cardoc
//
//  Created by 심영민 on 2021/11/13.
//

import Foundation
import RxSwift

class ReadmeViewModel {
    
    private let readmeUseCase: ReadmeUseCaseProtocol
    private var endPoint: String?
    internal var detailUser: Observable<DetailUser>?
    
    internal var readme: Observable<Readme> {
        return readmeUseCase.execute(with: endPoint! + EndPoint.readmeURL.description)
    }
    
    init(with readmeUseCase: ReadmeUseCaseProtocol) {
        self.readmeUseCase = readmeUseCase
    }
    
    func injectionDetailUser(with detailUser: DetailUser) {
        self.endPoint = detailUser.url
        self.detailUser = Observable.create { observer in
            observer.onNext(detailUser)
            return Disposables.create()
        }
    }
}
