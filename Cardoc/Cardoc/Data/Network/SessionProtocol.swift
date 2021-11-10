//
//  SessionProtocol.swift
//  Cardoc
//
//  Created by 심영민 on 2021/11/10.
//

import Foundation
import Alamofire

protocol SessionProtocol {
    func request(_ convertible: URLConvertible,
                      method: HTTPMethod,
                      parameters: Parameters?,
                      encoding: ParameterEncoding,
                      headers: HTTPHeaders?,
                      interceptor: RequestInterceptor?,
                      requestModifier: Session.RequestModifier?) -> DataRequest
}

extension Session: SessionProtocol {
    // SessionProtocol을 채택했지만
    // 이미 request함수가 구현되어 있기때문에 따로 구현하지 않아도 된다.
}
