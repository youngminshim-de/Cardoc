//
//  DetailUserDTO + Mapping.swift
//  Cardoc
//
//  Created by 심영민 on 2021/11/11.
//

import Foundation

struct DetailUserDTO: Decodable {
    private let owner: Item
    private let name: String
    private let stargazersCount: Int
    private let description: String?
    private let language: String?
    private let htmlUrl: String
    private let url: String
    
    func toDomain() -> DetailUser {
        return .init(owner: self.owner, name: self.name, stargazersCount: self.stargazersCount, description: self.description, language: self.language, htmlUrl: self.htmlUrl, url: self.url)
    }
}
