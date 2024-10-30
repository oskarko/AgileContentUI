//
//  AgileContentUIApp.swift
//  AgileContentUI
//
//  Created by Oscar Rodriguez Garrucho on 30/10/24
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2024 Oscar Rodriguez Garrucho. All rights reserved.
//

import SwiftUI

@main
struct AgileContentUIApp: App {
    @StateObject var navigation = NavigationState()
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(named: "agileContentColor") ?? .clear
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.shadowColor = .clear
        appearance.shadowImage = UIImage()
        appearance.backButtonAppearance.normal.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        
        // Elimina el texto del botón de retroceso
        appearance.backButtonAppearance.normal.titlePositionAdjustment = UIOffset(horizontal: -1000, vertical: 0)
        
        // Configura una imagen personalizada para el botón de retroceso "<"
        if let backImage = UIImage(systemName: "arrow.left")?.withTintColor(.white, renderingMode: .alwaysOriginal) {
            appearance.setBackIndicatorImage(backImage, transitionMaskImage: backImage)
        }
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigation.routes) {
                ViewerScreen()
                    .environmentObject(navigation)
                    .navigationDestination(for: Route.self, destination: { route in
                        switch route {
                        case .home:
                            ViewerScreen()
                                .environmentObject(navigation)
                        case .detail(let user):
                            UserDetailScreen(viewModel: ViewerViewModel(), user: user)
                                .environmentObject(navigation)
                        }
                    })
            }
        }
    }
    
}
