//
//  GithubUserRepository.swift
//  AgileContent
//
//  Created by Oscar Rodriguez Garrucho on 30/10/24
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2024 Oscar Rodriguez Garrucho. All rights reserved.
//

import Foundation

protocol GithubUserRepositoryProtocol {
    func fetchUserData(userName: String) async throws -> GithubUser
}

final class GithubUserRepository: GithubUserRepositoryProtocol {
    
    private let apiClient: HTTPClientProtocol
    
    init(apiClient: HTTPClientProtocol) {
        self.apiClient = apiClient
    }
    
    func fetchUserData(userName: String) async throws -> GithubUser {
        let repsitoriesInfo: [RepositoryInfoDTO] = try await apiClient.data(from: AgileContentEndpoint.githubUser(userName: userName))
        return GithubUser(dto: repsitoriesInfo)
    }
}
