//
//  NetworkDispatcher.swift
//  Cardoc
//
//  Created by 심영민 on 2021/11/10.
//

import Foundation
import Alamofire
import RxSwift

protocol NetworkDispatcher {
    func execute(request: Requestable) -> Observable<Data>
}

final class SearchingDispatcher: NetworkDispatcher {
    
    private var session: SessionProtocol
    
    init(with session: SessionProtocol) {
        self.session = session
    }
    
    func execute(request: Requestable) -> Observable<Data> {
        return Observable.create { [weak self] observer in
            guard let url = request.url() else {
                observer.onError(NetworkError.invalidURL)
                return Disposables.create()
            }
            
            self?.session.request(url, method: request.httpMethod, parameters: request.bodyParams,
                                  encoding: URLEncoding.default, headers: request.headers, interceptor: nil, requestModifier: nil)
                .validate(statusCode: 200..<300)
                .responseData { response in
                    switch response.result {
                    case .failure(_):
                        observer.onError(NetworkError.invalidRequest)
                    case .success(let data):
                        observer.onNext(data)
                    }
                }
            return Disposables.create()
        }
    }
}
