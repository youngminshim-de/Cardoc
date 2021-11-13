//
//  ReadMeDTO + Mapping.swift
//  Cardoc
//
//  Created by 심영민 on 2021/11/13.
//

import Foundation

struct ReadMeDTO: Decodable {
    private let name: String
    private let content: String
    private let encoding: String
    private let url: String
    private let downloadUrl: String
    
    func todomain() -> ReadMe {
        return .init(name: self.name, content: self.content, encoding: self.encoding, url: self.url, downloadUrl: self.downloadUrl)
    }
}

