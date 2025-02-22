//
//  Characters.swift
//  RickMortyApp
//
//  Created by Bakar Kharabadze on 5/31/24.
//
import Foundation

// MARK: - RickAndMortyResponse
struct RickAndMortyResponse: Codable {
    let info: Info
    let results: [Character]
}

// MARK: - Info
struct Info: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}

// MARK: - Character
struct Character: Codable, Identifiable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Origin
    let location: Location
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

// MARK: - Origin
struct Origin: Codable {
    let name: String
    let url: String
}

