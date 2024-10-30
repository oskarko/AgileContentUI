//
//  URLRequest+Extensions.swift
//  AgileContent
//
//  Created by Oscar Rodriguez Garrucho on 30/10/24
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2024 Oscar Rodriguez Garrucho. All rights reserved.
//

import Foundation

extension URLRequest {
    
    func debug() {
        print(
        """
        
        - REQUEST                      
        - METHOD: \(self.httpMethod ?? "")
        - URL: \(String(describing: self.url))
        - HEADERS: \(self.allHTTPHeaderFields ?? ["": ""])
        - BODY: \(String(data: self.httpBody ?? Data(), encoding: .utf8) ?? "")
        """
        )
    }
}
