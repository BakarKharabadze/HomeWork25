//
//  CharactersViewModel.swift
//  RickMortyApp
//
//  Created by Bakar Kharabadze on 5/31/24.
//

import Foundation
import Networking

//MARK: - CharactersViewModel
final class CharactersViewModel: ObservableObject {
    @Published var characters: [Character] = []
    @Published var info: Info?
    
    func fetchCharacters() {
        let urlString = "https://rickandmortyapi.com/api/character"
        NetworkManager.shared.request(url: urlString) { [weak self] (result: Result<RickAndMortyResponse, NetworkError>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self?.characters = response.results
                    self?.info = response.info
                case .failure(let error):
                    print("Failed to fetch characters: \(error)")
                }
            }
        }
    }
}
