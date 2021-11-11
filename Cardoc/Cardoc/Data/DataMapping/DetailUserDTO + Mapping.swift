//
//  DetailUserDTO + Mapping.swift
//  Cardoc
//
//  Created by 심영민 on 2021/11/11.
//

import Foundation

struct DetailUserDTO: Decodable {
    private (set) var respositories: [RepositoryDTO]
}

extension DetailUserDTO {
    struct RepositoryDTO: Decodable {
        private (set) var owner: Item
        private (set) var description: String
        private (set) var stargazers_count: Int
        private (set) var html_url: String
        
        func toDomain() -> Repository {
            return .init(owner: self.owner, description: self.description, stargazers_count: self.stargazers_count, html_url: self.html_url)
        }
    }
    
    private func toDomainDetailUsers() -> [Repository] {
        return respositories.map{ detailUserDTO in
            detailUserDTO.toDomain()
        }
    }
    
    func toDomain() -> DetailUser {
        return .init(respositories: toDomainDetailUsers())
    }
}
