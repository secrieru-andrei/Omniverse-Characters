//
//  MainView.swift
//  TaskApp
//
//  Created by Secrieru Andrei on 16.03.2023.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var coordinator: MainCoordinator
    @State var idd = 1
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
                        .transition(.opacity)
                case .characterDetails(id: let id):
                    CharacterDetailsView(viewModel: coordinator.charactersDetailsViewModel)
                        .transition(.opacity)
//                case .characterDetails:
//                    CharacterDetailsView(viewModel: coordinator.charactersDetailsViewModel)
//                        .transition(.opacity)
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
