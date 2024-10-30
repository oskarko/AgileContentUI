//
//  RepositoryRow.swift
//  AgileContent
//
//  Created by Oscar Rodriguez Garrucho on 30/10/24
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2024 Oscar Rodriguez Garrucho. All rights reserved.
//

import SwiftUI

struct RepositoryRow: View {
    let info: RepositoryInfo
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(info.name)
                .font(.headline)
            Text(info.language ?? "Unknowed")
                .font(.subheadline)
                .foregroundColor(Color.gray)
        }
    }
}

#Preview {
    RepositoryRow(info: .init(id: UUID().hashValue, 
                              name: "Capybara",
                              language: "Shell Script"))
}
