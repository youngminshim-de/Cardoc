//
//  Requestable.swift
//  Cardoc
//
//  Created by 심영민 on 2021/11/10.
//

import Foundation
import Alamofire

protocol Requestable {
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var bodyParams: [String: Any]? { get }
    var headers: [String: String]? { get }
    func url() -> URL?
}

class SearchRequest: Requestable {
    var path: String
    var httpMethod: HTTPMethod
    var bodyParams: [String : Any]?
    var headers: [String : String]?
    
    init(path: String, httpMethod: HTTPMethod, bodyParams: [String:Any]? = nil, headers: [String: String]? = nil) {
        self.path = path
        self.httpMethod = httpMethod
        self.bodyParams = bodyParams
        self.headers = headers
    }
    
    func url() -> URL? {
        return URL(string: path)
    }
}

enum EndPoint: CustomStringConvertible {
    case mainURL
    
    var description: String {
        switch self {
        case .mainURL:
            return "https://api.github.com/"
        }
    }
}
