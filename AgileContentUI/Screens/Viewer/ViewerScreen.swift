//
//  ViewerScreen.swift
//  AgileContent
//
//  Created by Oscar Rodriguez Garrucho on 30/10/24
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2024 Oscar Rodriguez Garrucho. All rights reserved.
//

import SwiftUI

struct ViewerScreen: View {
    @EnvironmentObject
    var navigation: NavigationState
    
    @StateObject
    var viewerViewModel = ViewerViewModel()
    
    @State
    var username: String = ""
    
    
    @State
    var errorIsPresented: Bool = false
    
    @State
    var errorInfo: UserSearchError?
    
    var body: some View {
        VStack(spacing: 24) {
            Image(.agilecontent)
                .resizable()
                .scaledToFit()
                .frame(width: 240, height: 240)
            
            searchUserTextField
                
            button

            Spacer()
        }
        .navigationTitle("home_navigation_title")
        .navigationBarTitleDisplayMode(.inline)
        .padding()
        .onChange(of: viewerViewModel.state) { newValue in
            if case .success(let user) = newValue {
                navigation.routes.append(.detail(user))
            }
            
            if case .failure(let error) = newValue {
                errorInfo = error
                errorIsPresented.toggle()
            }
        }
        .animation(.easeInOut, value: viewerViewModel.state)
        .alert(.init(errorInfo?.textError ?? ""), isPresented: $errorIsPresented) {
            Button {
                errorIsPresented = false
            } label: {
                Text("OK")
            }

        }
    }
    
    var searchUserTextField: some View {
        TextField("username", text: $username)
            .autocorrectionDisabled()
            .textInputAutocapitalization(.never)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .submitLabel(.done)
            .onSubmit {
                searchAction()
            }
            .frame(width: 300, height: 50)
    }
    
    var button: some View {
        VStack {
            if viewerViewModel.state == .loading {
                ProgressView()
            } else {
                Button {
                    searchAction()
                } label: {
                    Text("search")
                        .font(.title3)
                        .frame(width: 150, height: 40)
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .tint(Color.agileContentColor)
        .cornerRadius(8)
    }
    
    func searchAction() {
        Task {
            await viewerViewModel.fetchUser(with: username)
            username = ""
        }
    }
}

#Preview {
    ViewerScreen()
}
