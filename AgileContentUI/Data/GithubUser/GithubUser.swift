//
//  GithubUser.swift
//  AgileContent
//
//  Created by Oscar Rodriguez Garrucho on 30/10/24
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2024 Oscar Rodriguez Garrucho. All rights reserved.
//

import Foundation

struct GithubUser: Identifiable, Hashable, Equatable {
    let name: String
    let avatarURL: URL?
    let repositoriesInfo: [RepositoryInfo]
    
    var id: String { name }
}

struct RepositoryInfo: Identifiable, Hashable, Equatable {
    let id: Int
    let name: String
    let language: String?
}

extension GithubUser {
    init(dto: [RepositoryInfoDTO]) {
        name = dto.compactMap { $0.owner.login }.first ?? "No Name"
        if let imageURL = URL(string: dto.compactMap { $0.owner.avatarURL }.first ?? "") {
            avatarURL = imageURL
        } else {
            avatarURL = nil
        }
        repositoriesInfo = dto.map { RepositoryInfo(dto: $0) }
    }
}

extension RepositoryInfo {
    init (dto: RepositoryInfoDTO) {
        self.id = dto.id
        self.name = dto.name
        self.language = dto.language
    }
}
