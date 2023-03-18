//
//  CharacterDetailViewModel.swift
//  TaskApp
//
//  Created by Secrieru Andrei on 16.03.2023.
//

import Foundation

final class CharacterDetailsViewModel: TopBarNavigationProtocol{
    internal unowned let coordinator: MainCoordinator
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
}
