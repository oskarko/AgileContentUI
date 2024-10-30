//
//  ViewerViewModel.swift
//  AgileContent
//
//  Created by Oscar Rodriguez Garrucho on 30/10/24
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2024 Oscar Rodriguez Garrucho. All rights reserved.
//

import Foundation

enum UserSearchError: Error {
    case apiError
    case noUserFound
    
    var textError: String {
        switch self {
        case .apiError:
            return "network_error_message"
        case .noUserFound:
            return "user_error_message"
        }
    }
}

enum ViewerState: Equatable {
    case idle
    case loading
    case success(GithubUser)
    case failure(UserSearchError)
}

final class ViewerViewModel: ObservableObject {
    @Published var state: ViewerState = .idle
    
    private let service: GithubUserServiceProtocol
    
    init(
        service: GithubUserServiceProtocol = GithubUserService(
            repository: GithubUserRepository(
                apiClient: HTTPClient()
            )
        )
    ) {
        self.service = service
    }
    
    @MainActor
    func fetchUser(with username: String) async {
        state = .loading
        do {
            let user = try await service.fetchUserData(userName: username)
            state = .success(user)
        } catch {
            print("[ViewerViewModel] - Error fetching user data: \(error)")
            if let statusError = error as? APIError, case let .statusCode(code) = statusError, code == 404 {
                state = .failure(.noUserFound)
            } else {
                state = .failure(.apiError)
            }
        }
    }
}
