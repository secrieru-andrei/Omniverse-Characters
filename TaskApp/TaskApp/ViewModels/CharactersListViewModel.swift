//
//  CharactersListViewModel.swift
//  TaskApp
//
//  Created by Secrieru Andrei on 16.03.2023.
//

import Foundation

final class CharactersListViewModel: TopBarNavigationProtocol{
    
    internal unowned let coordinator: MainCoordinator
    @Published var viewTitle = "Rick and Morty"
    @Published var charactersArray: [SingleCharacter] = []
    private let stringURL = "https://rickandmortyapi.com/api/character"
    private let apiServices = ApiServices()
    @Published var firstSeenIn: [Int : Episode] = [:]
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
        self.getCharactersData()
    }
}

//MARK: - Fetch Data
typealias CharactersListViewModelData = CharactersListViewModel
extension CharactersListViewModelData {
    func getCharactersData() {
        apiServices.getData(stringURL: stringURL, expected: CharactersData.self) { [weak self] (result) in
            switch result {
            case .failure(let error):
                print("Error: \(error)")
            case.success(let result):
                self?.charactersArray = result.characters
                self?.getAllCharacterFirstAppearence()
                
            }
        }
    }
    
    func getAllCharacterFirstAppearence() {
        for character in charactersArray {
            apiServices.getData(stringURL: character.episode[0], expected: Episode.self) { [weak self] (result) in
                switch result {
                case .failure(let error):
                    print("Error: \(error)")
                case.success(let result):
                    self?.firstSeenIn[character.id] = result
                }
            }
        }
    }
    
    func getSingleCharacterFirstAppearence(charater: SingleCharacter) -> String {
        guard let episode = firstSeenIn[charater.id] else { return "" }
        return episode.name
    }
}

typealias CharactersListViewModelNavigation = CharactersListViewModel
extension CharactersListViewModelNavigation {
    
    func navigateTo(to view: ViewsEnum) {
        coordinator.navigatoTo(view: view)
    }
    
    func backToRoot(to view: ViewsEnum) {
        coordinator.backToRoot(viewToPush: view)
    }
}

typealias CharactersListViewModelSharedData = CharactersListViewModel
extension CharactersListViewModelSharedData {
    
    func transferData(currentCharacter: SingleCharacter) {
        coordinator.charactersDetailsViewModel.currentCharacter = currentCharacter
        coordinator.shareData(vm1: coordinator.charactersListViewModel, vm2: coordinator.charactersDetailsViewModel)
    }
}
