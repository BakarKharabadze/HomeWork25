//
//  CharacterDetalViewModel.swift
//  RickMortyApp
//
//  Created by Bakar Kharabadze on 5/31/24.
//

import Networking
import Foundation

//MARK: - CharacterDetalViewModel
final class CharacterDetalViewModel: ObservableObject {
    
    @Published var episodes: [Episode] = []
    
    
    func fetchDetailEpisodes(for episodes: [String]) {
        self.episodes.removeAll()
        episodes.forEach { episode in
            NetworkManager.shared.request(url: episode) { [weak self] (result: Result<Episode, NetworkError>) in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let episode):
                        self?.episodes.append(episode)
                        self?.episodes.sort(by: {$0.id < $1.id })
                    case .failure(let error):
                        print("Failed to fetch characters: \(error)")
                    }
                }
            }
        }
       
    }
}
