//
//  ReadMe.swift
//  Cardoc
//
//  Created by 심영민 on 2021/11/13.
//

import Foundation

struct ReadMe: Decodable {
    private (set) var name: String
    private (set) var content: String
    private (set) var encoding: String
    private (set) var url: String
    private (set) var downloadUrl: String
}
