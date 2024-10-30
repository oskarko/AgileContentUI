//
//  Encodable+Extensions.swift
//  AgileContent
//
//  Created by Oscar Rodriguez Garrucho on 30/10/24
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2024 Oscar Rodriguez Garrucho. All rights reserved.
//

import Foundation

extension Encodable {
    
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        
        return (try? JSONSerialization
            .jsonObject(with: data, options: .allowFragments))
            .flatMap { $0 as? [String: Any] }
    }
}
