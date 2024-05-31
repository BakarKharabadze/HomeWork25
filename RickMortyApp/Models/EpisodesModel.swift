//
//  EpisodesModel.swift
//  RickMortyApp
//
//  Created by Bakar Kharabadze on 5/31/24.
//

import Foundation

// MARK: - RickAndMortyEpisodesResponse
struct RickAndMortyEpisodesResponse: Codable {
    let info: Info
    let results: [Episode]
}

// MARK: - Episode
struct Episode: Codable, Hashable, Identifiable {
    let id: Int
    let name: String
    let airDate: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case airDate = "air_date"
        case episode, characters, url, created
    }
}
