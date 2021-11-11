//
//  DetailUser.swift
//  Cardoc
//
//  Created by 심영민 on 2021/11/11.
//

import Foundation

struct DetailUser: Decodable {
    private (set) var respositories: [Repository]
}

struct Repository: Decodable {
    private (set) var owner: Item
    private (set) var description: String
    private (set) var stargazers_count: Int
    private (set) var html_url: String
}
