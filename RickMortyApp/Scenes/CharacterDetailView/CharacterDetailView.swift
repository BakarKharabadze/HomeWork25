//
//  CharacterDetailView.swift
//  RickMortyApp
//
//  Created by Bakar Kharabadze on 5/31/24.
//

import SwiftUI

//MARK: - CharacterDetailView
struct CharacterDetailView: View {
    
    @StateObject private var viewModel = CharacterDetalViewModel()
    let character: Character
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                ZStack(alignment: .leading) {
                    Color.white
                        .cornerRadius(10)
                        .shadow(color: .gray, radius: 5, x: 0, y: 2)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Status:")
                                .font(.headline)
                            Text(character.status)
                                .font(.subheadline)
                                .foregroundColor(character.status == "Alive" ? .green : .red)
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Species:")
                                .font(.headline)
                            Text(character.species)
                                .font(.subheadline)
                                .foregroundColor(character.species == "Human" ? .green : .red)
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Gender:")
                                .font(.headline)
                            Text(character.gender)
                                .font(.subheadline)
                                .foregroundColor(character.gender == "Male" ? .blue : .pink)
                        }
                        
                        if !character.type.isEmpty {
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Type:")
                                    .font(.headline)
                                Text(character.type)
                                    .font(.subheadline)
                            }
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Origin:")
                                .font(.headline)
                            Text(character.origin.name)
                                .font(.subheadline)
                                .foregroundColor(character.origin.name == "Earth (Replacement Dimension)" ? .green : .blue)
                        }
                    }
                    .padding()
                }
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Episodes:")
                        .font(.headline)
                    
                    LazyVStack(alignment: .leading, spacing: 10) {
                        ForEach(viewModel.episodes) { episode in
                            ZStack(alignment: .leading) {
                                Color.white
                                    .cornerRadius(10)
                                    .shadow(color: .gray, radius: 5, x: 0, y: 2)
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(episode.name)
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                    
                                    Text("Episode: \(episode.episode)")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                    
                                    Text("Aired on: \(episode.airDate)")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                                .padding()
                            }
                        }
                    }
                }
                .padding(.top)
            }
            .padding()
        }
        .navigationBarTitle(character.name)
        .onAppear {
            viewModel.fetchDetailEpisodes(for: character.episode)
        }
    }
}
