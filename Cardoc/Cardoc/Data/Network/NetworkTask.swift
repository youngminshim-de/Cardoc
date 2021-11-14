//
//  NetworkTask.swift
//  Cardoc
//
//  Created by 심영민 on 2021/11/10.
//

import Foundation
import Alamofire
import RxSwift
import NSObject_Rx

class Task<Input, Output>: NSObject {
    func fetch(_ request: Input, _ dataType: Output.Type) -> Observable<Output> {
        return Observable.create { observer in
            return Disposables.create()
        }
    }
}

final class NetworkTask<Input: Requestable, Output: Decodable>: Task<Input, Output> {
    private var dispatcher: NetworkDispatcher
    private var decoder: JSONDecoder
    
    init(with dispatcher: NetworkDispatcher, with decoder: JSONDecoder, with keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy) {
        self.dispatcher = dispatcher
        self.decoder = decoder
        decoder.keyDecodingStrategy = keyDecodingStrategy
    }
    
    override func fetch(_ request: Input, _ dataType: Output.Type) -> Observable<Output> {
        dispatcher.execute(request: request).flatMap { data in
            self.decodedData(type: dataType.self, data: data)
        }
    }
    
    func decodedData<Output: Decodable>(type: Output.Type, data: Data) -> Observable<Output> {
            return Observable.create { observer in
                do {
                    let result = try self.decoder.decode(type, from: data)
                    observer.onNext(result)
                } catch (_) {
                    observer.onError(NetworkError.failedDecoding)
                }
                return Disposables.create()
            }
        }
}
