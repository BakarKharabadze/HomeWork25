//
//  EpisodeViewModel.swift
//  RickMortyApp
//
//  Created by Bakar Kharabadze on 5/31/24.
//

import Foundation
import Networking

//MARK: - EpisodeViewModel
final class EpisodeViewModel: ObservableObject {
    @Published var episodes: [Episode] = []
    @Published var info: Info?
    
    func fetchEpisodes() {
        let urlString = "https://rickandmortyapi.com/api/episode"
        NetworkManager.shared.request(url: urlString) { [weak self] (result: Result<RickAndMortyEpisodesResponse, NetworkError>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self?.episodes = response.results
                    self?.info = response.info
                case .failure(let error):
                    print("Failed to fetch characters: \(error)")
                }
            }
        }
    }
}
