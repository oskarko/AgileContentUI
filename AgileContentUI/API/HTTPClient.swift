//
//  HTTPClient.swift
//  AgileContent
//
//  Created by Oscar Rodriguez Garrucho on 30/10/24
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2024 Oscar Rodriguez Garrucho. All rights reserved.
//

import Foundation

protocol HTTPClientProtocol {
    func perform(endpoint: Endpoint) async throws -> Data
    func data<T: Decodable>(from endpoint: Endpoint) async throws -> T
}

class HTTPClient: HTTPClientProtocol {
    
    private let session: URLSession = {
        let configuration = URLSessionConfiguration.default
        return URLSession(configuration: configuration)
    }()

    private lazy var decoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .millisecondsSince1970
        return jsonDecoder
    }()
    
}

private extension HTTPClient {
    func performRequest(_ request: URLRequest) async throws -> Data {
        request.debug()
        let (data, response) = try await session.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            print("Invalid response with request: \(response)")
            throw APIError.invalidResponse
        }
        
        logResponse(httpResponse, data: data)
        
        switch httpResponse.statusCode {
        case 200...299:
            return data
        case 401:
            throw APIError.unathorizedResponse
        default:
            throw APIError.statusCode(httpResponse.statusCode)
        }
    }
    
    func downloadURL(_ request: URLRequest) async throws -> URL {
        request.debug()
        let (url, response) = try await session.download(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            print("Invalid response with request: \(response)")
            throw APIError.invalidResponse
        }
        
        logResponse(httpResponse, data: url.absoluteString.data(using: .utf8))
        return url
    }
    
    private func logResponse(_ response: HTTPURLResponse, data: Data?) {
        print(
            """
            
            RESPONSE:   \(response.url?.absoluteString ?? "")
            CODE:       \(response.statusCode)
            HEADERS:    \(response.allHeaderFields)
            BODY        \(data?.prettyPrintedJSON() ?? "")
            """
        )
    }
}

extension HTTPClient {
    @discardableResult
    func perform(endpoint: Endpoint) async throws -> Data {
        let request = try endpoint.getURLRequest()
        return try await performRequest(request)
    }
    
    func data<T: Decodable>(from endpoint: Endpoint) async throws -> T {
        let request = try endpoint.getURLRequest()
        let data = try await performRequest(request)
        return try decoder.decode(from: data)
    }
}
