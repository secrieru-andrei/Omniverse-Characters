//
//  NavigationProtocol.swift
//  TaskApp
//
//  Created by Secrieru Andrei on 16.03.2023.
//

import Foundation

protocol TopBarNavigationProtocol: Identifiable, ObservableObject {
    
    var coordinator: MainCoordinator { get }
    init(coordinator: MainCoordinator)
    
}

