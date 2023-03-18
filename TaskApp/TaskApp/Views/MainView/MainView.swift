//
//  MainView.swift
//  TaskApp
//
//  Created by Secrieru Andrei on 16.03.2023.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var coordinator: MainCoordinator
    
    init() {
        self.coordinator = MainCoordinator()
    }
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            
            VStack(spacing: 16) {
                switch coordinator.currentView {
                case .charactersList:
                    CharactersListView(viewModel: coordinator.charactersListViewModel)
                        .transition(.move(edge: .leading))
                case .characterDetails:
                    CharacterDetailsView(viewModel: coordinator.charactersDetailsViewModel)
                        .transition(.move(edge: .trailing))
                case .none:
                    EmptyView()
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
