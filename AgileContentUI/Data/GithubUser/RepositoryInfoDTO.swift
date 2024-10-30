//
//  GithubUserDTO.swift
//  AgileContent
//
//  Created by Oscar Rodriguez Garrucho on 30/10/24
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2024 Oscar Rodriguez Garrucho. All rights reserved.
//

import Foundation

struct RepositoryInfoDTO: Decodable {
    let id: Int
    let name: String
    let language: String?
    let owner: Owner
}

struct Owner: Decodable {
    let login: String?
    let avatarURL: String?
    
    enum CodingKeys: String, CodingKey {
        case login
        case avatarURL = "avatar_url"
    }
}
