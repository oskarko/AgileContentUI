//
//  AgileContentEndpoint.swift
//  AgileContent
//
//  Created by Oscar Rodriguez Garrucho on 30/10/24
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2024 Oscar Rodriguez Garrucho. All rights reserved.
//

import Foundation

enum AgileContentEndpoint {
    case githubUser(userName: String)
}

extension AgileContentEndpoint: Endpoint {

    var host: String {
        return "api.github.com"
    }
    
    var path: String {
        switch self {
        case .githubUser(let userName):
            "/users/\(userName)/repos"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .githubUser:
            .get
        }
    }
    
    var body: [String : Any]? {
        switch self {
        case .githubUser:
            nil
        }
    }
}
