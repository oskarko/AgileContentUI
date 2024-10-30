//
//  GithubUserService.swift
//  AgileContent
//
//  Created by Oscar Rodriguez Garrucho on 30/10/24
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2024 Oscar Rodriguez Garrucho. All rights reserved.
//

import Foundation

protocol GithubUserServiceProtocol {
    func fetchUserData(userName: String) async throws -> GithubUser
}

final class GithubUserService: GithubUserServiceProtocol {
    private let repository: GithubUserRepositoryProtocol
    
    init(repository: GithubUserRepositoryProtocol) {
        self.repository = repository
    }
    
    func fetchUserData(userName: String) async throws -> GithubUser {
        return try await repository.fetchUserData(userName: userName)
    }
}
