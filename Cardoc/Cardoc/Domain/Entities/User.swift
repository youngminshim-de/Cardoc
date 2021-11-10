//
//  User.swift
//  Cardoc
//
//  Created by 심영민 on 2021/11/10.
//

import Foundation

struct User: Decodable {
    private (set) var totalCount: Int
    private (set) var items: [Item]
}

struct Item: Decodable {
    private (set) var login: String
    private (set) var avatarUrl: String
    private (set) var reposUrl: String
}
