//
//  UserDetailScreen.swift
//  AgileContent
//
//  Created by Oscar Rodriguez Garrucho on 30/10/24
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2024 Oscar Rodriguez Garrucho. All rights reserved.
//

import SwiftUI

struct UserDetailScreen: View {
    
    @EnvironmentObject var navigation: NavigationState
    @ObservedObject var viewModel: ViewerViewModel
    
    let user: GithubUser
    
    var body: some View {
        VStack {
            imageWithName
                .background(Color.agileContentColor)
            
            listOfRepositories
        }
        .animation(.easeInOut, value: user.avatarURL)
        .refreshable {
            await viewModel.fetchUser(with: user.name)
        }
    }
    
    var imageWithName: some View {
        VStack(spacing: 16) {
            AsyncImage(url: user.avatarURL) { image in
                image
                    .resizable()
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .scaledToFit()
            } placeholder: {
                Image(systemName: "person")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .scaledToFit()
            }
            Text(user.name)
                .font(.title2)
                .foregroundColor(Color.white)
            Divider()
        }
    }
    
    var listOfRepositories: some View {
        List {
            ForEach(user.repositoriesInfo) { repository in
                RepositoryRow(info: repository)
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    UserDetailScreen(
        viewModel: ViewerViewModel(),
        user: MockData.getMockUser()
    )
}
