//
//  Endpoint.swift
//  AgileContent
//
//  Created by Oscar Rodriguez Garrucho on 30/10/24
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2024 Oscar Rodriguez Garrucho. All rights reserved.
//

import Foundation

protocol Endpoint {
    var host: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var body: [String: Any]? { get }
}

extension Endpoint {
    func getURLRequest() throws -> URLRequest {
        let url = try makeURL(from: self)
        var request = URLRequest(url: url)
        request.httpMethod = self.method.rawValue
        
        if let body {
            request.httpBody = makeBody(from: body)
        }
        
        return request
    }
    
    private func makeBody(from params: [String: Any]?) -> Data? {
        guard let params, !params.isEmpty else { return nil }
        
        return try? JSONSerialization.data(withJSONObject: params)
    }
    
    private func makeURL(from endpoint: Endpoint) throws -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = endpoint.host
        components.path = endpoint.path
        
        guard let url = components.url else {
            throw APIError.invalidURL
        }
        return url
    }
}
