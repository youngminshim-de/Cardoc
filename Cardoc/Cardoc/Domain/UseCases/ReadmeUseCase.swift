//
//  ReadmeUseCase.swift
//  Cardoc
//
//  Created by 심영민 on 2021/11/13.
//

import Foundation
import RxSwift

protocol ReadmeUseCaseProtocol {
    func execute(with endPoint: String) -> Observable<Readme>
}

class ReadmeUseCase: ReadmeRepositoryProtocol {
    private let readmeRepository: ReadmeRepositoryProtocol
    
    init(with readmeRepository: ReadmeRepositoryProtocol) {
        self.readmeRepository = readmeRepository
    }
    
    func fetch(with endPoint: String) -> Observable<Readme> {
        return readmeRepository.fetch(with: endPoint)
    }
}
