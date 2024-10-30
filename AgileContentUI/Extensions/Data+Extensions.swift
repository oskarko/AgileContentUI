//
//  Data+Extensions.swift
//  AgileContent
//
//  Created by Oscar Rodriguez Garrucho on 30/10/24
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2024 Oscar Rodriguez Garrucho. All rights reserved.
//

import SwiftUI

extension Data {
    
    func prettyPrintedJSON() -> String? {
        if let jsonObject = try? JSONSerialization.jsonObject(with: self, options: []),
           let prettyPrintedData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted),
           let prettyJSONString = String(data: prettyPrintedData, encoding: .utf8) {
            return prettyJSONString
        } else {
            return nil
        }
    }
}
