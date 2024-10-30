//
//  NavigationState.swift
//  AgileContent
//
//  Created by Oscar Rodriguez Garrucho on 30/10/24
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2024 Oscar Rodriguez Garrucho. All rights reserved.
//

import Foundation

enum Route: Hashable {
    case home
    case detail(GithubUser)
}

class NavigationState: ObservableObject {
    @Published var routes: [Route] = []
    
    func popTo(_ route: Route) {
        guard let index = routes.firstIndex(where: { $0 == route}) else { return }
        routes = Array(routes[0...index])
    }
    
    func popToRoot() {
        routes.removeAll()
    }
}
