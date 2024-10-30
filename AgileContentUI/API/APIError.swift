//
//  APIError.swift
//  AgileContent
//
//  Created by Oscar Rodriguez Garrucho on 30/10/24
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2024 Oscar Rodriguez Garrucho. All rights reserved.
//

import Foundation

enum APIError: Error {
    case networkError(Error)
    case decoding
    case invalidURL
    case invalidResponse
    case unathorizedResponse
    case statusCode(Int)
    case ottCheckTimeout
}
