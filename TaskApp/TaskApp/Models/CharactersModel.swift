//
//  CharactersModel.swift
//  TaskApp
//
//  Created by Secrieru Andrei on 16.03.2023.
//

import Foundation

// MARK: - Character Model
struct CharactersData: Codable {
    let characters: [SingleCharacter]
    
    private enum CodingKeys: String, CodingKey {
            case characters = "results"
        }
}

// MARK: - Result
struct SingleCharacter: Codable {
    let id: Int
    let name, status, species, type: String
    let gender: String
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

// MARK: - Location
struct Location: Codable {
    let name: String
    let url: String
}
