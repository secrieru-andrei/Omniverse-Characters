//
//  MainCoordinator.swift
//  TaskApp
//
//  Created by Secrieru Andrei on 16.03.2023.
//

import Foundation

class MainCoordinator: ObservableObject, Identifiable {
    
    @Published var currentView: ViewsEnum = .charactersList
    @Published var charactersListViewModel: CharactersListViewModel!
    @Published var charactersDetailsViewModel: CharacterDetailsViewModel!
    @Published var navigationStack: [ViewsEnum] = []

    
    init() {
        charactersListViewModel = CharactersListViewModel(coordinator: self)
        charactersDetailsViewModel = CharacterDetailsViewModel(coordinator: self)
        start()
    }
    
    func start() {
        navigationStack.append(currentView)
    }
}
