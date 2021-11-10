//
//  NetworkError.swift
//  Cardoc
//
//  Created by 심영민 on 2021/11/10.
//

import Foundation

enum NetworkError: Error, CustomStringConvertible {
    case invalidURL, failedDecoding, invalidRequest
    
    var description: String {
        switch self {
        case .invalidURL:
            return "URL이 올바르지 않습니다."
        case .failedDecoding:
            return "Decoding이 올바르지 않습니다."
        case .invalidRequest:
            return "네트워크 연결 상태를 확인하세요."
        }
    }
}
