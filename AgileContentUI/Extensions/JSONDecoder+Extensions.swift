//
//  JSONDecoder+Extensions.swift
//  AgileContent
//
//  Created by Oscar Rodriguez Garrucho on 30/10/24
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2024 Oscar Rodriguez Garrucho. All rights reserved.
//

import Foundation

extension JSONDecoder {
    
    func decode<T: Decodable>(from data: Data) throws -> T {
        do {
            return try self.decode(T.self, from: data)
        } catch let DecodingError.dataCorrupted(context) {
            print(context)
            throw APIError.decoding
        } catch let DecodingError.keyNotFound(key, context) {
            print("Key '\(key)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
            throw APIError.decoding
        } catch let DecodingError.valueNotFound(value, context) {
            print("Value '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
            throw APIError.decoding
        } catch let DecodingError.typeMismatch(type, context) {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
            throw APIError.decoding
        } catch {
            print("error: ", error)
            throw APIError.decoding
        }
    }
}
