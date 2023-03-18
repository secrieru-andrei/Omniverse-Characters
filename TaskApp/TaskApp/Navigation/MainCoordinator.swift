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
    @Published var detailsViewId: Int = 1
    
    
    init() {
        charactersListViewModel = CharactersListViewModel(coordinator: self)
        charactersDetailsViewModel = CharacterDetailsViewModel(coordinator: self)
        start()
    }
    
    func start() {
        navigationStack.append(currentView)
    }
}

typealias MainCoordinatorNavigation = MainCoordinator
extension MainCoordinatorNavigation {
    
    func backToRoot(viewToPush: ViewsEnum) {
        navigationStack.removeLast()
        guard let newView = navigationStack.last else { return }
        currentView = newView
    }
    
    func navigatoTo(view: ViewsEnum) {
        navigationStack.append(view)
        guard let lastView = navigationStack.last else { return }
        currentView = lastView
    }
    
    func swithDetailsScreen(id: Int) {
        navigationStack.removeLast()
        navigationStack.append(.characterDetails(id: id))
        guard let lastView = navigationStack.last else { return }
        currentView = lastView
    }
}

typealias MainCoordinatorSharedData = MainCoordinator
extension MainCoordinatorSharedData {
    func shareData(vm1: CharactersListViewModel, vm2: CharacterDetailsViewModel) {
        vm2.charactersArray = vm1.charactersArray
        vm2.firstSeenIn = vm1.firstSeenIn
    }
}
