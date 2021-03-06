//
//  UserListDTO + Mapping.swift
//  Cardoc
//
//  Created by 심영민 on 2021/11/10.
//

import Foundation

struct UserListDTO: Decodable {
    private let totalCount: Int
    private let items: [ItemDTO]
}

extension UserListDTO {
    struct ItemDTO: Decodable {
        private let login: String
        private let avatarUrl: String
        private let htmlUrl: String
        private let reposUrl: String

        func toDomain() -> Item {
            return .init(login: self.login, avatarUrl: self.avatarUrl, htmlUrl: self.htmlUrl, reposUrl: self.reposUrl)
        }
    }
    
    private func toDomainItems() -> [Item] {
        return items.map{ itemDTO in
            itemDTO.toDomain()
        }
    }
    
    func toDomain() -> UserList {
        return .init(totalCount: self.totalCount, items: self.toDomainItems())
    }
}
