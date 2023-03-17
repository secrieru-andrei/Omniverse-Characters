//
//  LocationModel.swift
//  TaskApp
//
//  Created by Secrieru Andrei on 17.03.2023.
//

import Foundation

// MARK: - Welcome
//struct EpisodeModel: Codable {
//    let id: Int
//    let name, airDate, episode: String
//    let characters: [String]
//    let url: String
//    let created: String
//
//    enum CodingKeys: String, CodingKey {
//        case id, name
//        case airDate = "air_date"
//        case episode, characters, url, created
//    }
//}

struct Episode: Codable {
    let id: Int
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
}
