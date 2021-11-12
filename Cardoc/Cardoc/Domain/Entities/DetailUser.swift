//
//  DetailUser.swift
//  Cardoc
//
//  Created by 심영민 on 2021/11/11.
//

import Foundation

struct DetailUser: Decodable {
    private (set) var owner: Item
    private (set) var stargazersCount: Int
    private (set) var description: String?
    private (set) var language: String?
    private (set) var htmlUrl: String
}
