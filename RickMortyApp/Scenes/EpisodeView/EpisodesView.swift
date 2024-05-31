//
//  EpisodesView.swift
//  RickMortyApp
//
//  Created by Bakar Kharabadze on 5/31/24.
//

import SwiftUI

struct EpisodesView: View {
    
    @StateObject private var viewModel = EpisodeViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible())], alignment: .leading, spacing: 20) {
                    ForEach(viewModel.episodes) { episode in
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white)
                                .shadow(color: Color.gray.opacity(0.4), radius: 4, x: 0, y: 2)
                            
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Episode \(episode.id)")
                                    .font(.headline)
                                    .foregroundColor(.blue)
                                
                                Text(episode.name)
                                    .font(.subheadline)
                                    .foregroundColor(.primary)
                                
                                Text(episode.airDate)
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                
                                Text(episode.episode)
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            .padding()
                        }
                    }
                }
                .padding()
            }
            .navigationBarTitle("Episodes", displayMode: .large)
            .onAppear {
                viewModel.fetchEpisodes()
            }
        }
    }
}

#Preview {
    EpisodesView()
}
