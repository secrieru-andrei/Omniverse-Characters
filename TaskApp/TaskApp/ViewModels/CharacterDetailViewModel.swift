//
//  CharacterDetailViewModel.swift
//  TaskApp
//
//  Created by Secrieru Andrei on 16.03.2023.
//

import Foundation

final class CharacterDetailsViewModel: TopBarNavigationProtocol{
    internal unowned let coordinator: MainCoordinator
    
    @Published var viewTitle = "Character Name"
    @Published var charactersArray: [SingleCharacter] = []
    @Published var firstSeenIn: [Int : Episode] = [:]
    @Published var currentCharacter: SingleCharacter!

    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
}

typealias CharacterDetailsViewModelData = CharacterDetailsViewModel
extension CharacterDetailsViewModelData {
    
    func getSingleCharacterFirstAppearence(charater: SingleCharacter) -> String {
        guard let episode = firstSeenIn[charater.id] else { return "" }
        return episode.name
    }
}

typealias CharacterDetailsViewModelNavigation = CharacterDetailsViewModel
extension CharacterDetailsViewModelNavigation {
    
    func navigateTo(to view: ViewsEnum) {
        coordinator.navigatoTo(view: view)
    }
    
    func pushView(to view: ViewsEnum) {
        coordinator.pushView(viewToPush: view)
    }
}
