//
//  SearchViewModel.swift
//  RickMortyApp
//
//  Created by Bakar Kharabadze on 5/31/24.
//

import Foundation
import Networking

//MARK: - SearchViewModel
class SearchViewModel: ObservableObject {
    
    @Published var characters: [Character] = []
    @Published var episodes: [Episode] = []
    
    func getCharactersFiltered(searchText: String) -> [Character] {
        characters.filter { $0.name.localizedCaseInsensitiveContains(searchText)}
    }
    
    func getEpisodesFiltered(searchText: String) -> [Episode] {
        episodes.filter { $0.name.localizedCaseInsensitiveContains(searchText)}
    }
    
    
    func searchCharacters(name: String) {
        let urlString = "https://rickandmortyapi.com/api/character/?name=\(name)"
        NetworkManager.shared.request(url: urlString) { [weak self] (result: Result<RickAndMortyResponse, NetworkError>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self?.characters = response.results
                case .failure(let error):
                    print("Failed to search characters: \(error)")
                }
            }
        }
    }
    
    func searchEpisodes(name: String) {
        let urlString = "https://rickandmortyapi.com/api/episode/?name=\(name)"
        NetworkManager.shared.request(url: urlString) { [weak self] (result: Result<RickAndMortyEpisodesResponse, NetworkError>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self?.episodes = response.results
                case .failure(let error):
                    print("Failed to search episodes: \(error)")
                }
            }
        }
    }
    
    func performSearch(selectedSegment: Int, searchText: String) {
        if selectedSegment == 0 {
            searchCharacters(name: searchText)
        } else {
            searchEpisodes(name: searchText)
        }
    }
    
     func clearSearch() {
        characters = []
        episodes = []
    }
}
    
    
