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
    var headers: HTTPHeaders? { get }
    func url() -> URL?
}

final class SearchingRequest: Requestable {
    
    var path: String
    var httpMethod: HTTPMethod
    var bodyParams: [String : Any]?
    var headers: HTTPHeaders?
    
    init(path: String, httpMethod: HTTPMethod, bodyParams: [String:Any]? = nil, headers: HTTPHeaders? = nil) {
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
    case mainURL, searchingUserURL, readmeURL
    
    var description: String {
        switch self {
        case .mainURL:
            return "https://api.github.com/"
        case .searchingUserURL:
            return "https://api.github.com/search/users"
        case .readmeURL:
            return "/readme"
        }
    }
}
