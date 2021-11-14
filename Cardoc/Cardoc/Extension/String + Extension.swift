//
//  String + Extension.swift
//  Cardoc
//
//  Created by 심영민 on 2021/11/14.
//

import Foundation

extension String {
    func decodedBase64String() -> String {
        guard let data = Data(base64Encoded: self, options: .ignoreUnknownCharacters) else {
            return ""
        }
        
        return String(data: data, encoding: .utf8) ?? ""
    }
}
