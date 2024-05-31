//
//  CharactersView.swift
//  RickMortyApp
//
//  Created by Bakar Kharabadze on 5/31/24.
//

import SwiftUI

//MARK: - CharactersView
struct CharactersView: View {
    
    @StateObject private var viewModel = CharactersViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible())], alignment: .leading, spacing: 20) {
                    ForEach(viewModel.characters) { character in
                        NavigationLink(destination: CharacterDetailView(character: character)) {
                            ZStack(alignment: .leading) {
                                Color.white
                                    .cornerRadius(10)
                                    .shadow(color: .gray, radius: 5, x: 0, y: 2)
                                
                                VStack(alignment: .leading, spacing: 10) {
                                    Text(character.name)
                                        .foregroundColor(.black)
                                        .font(.headline)
                                }
                                .padding()
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding()
            }
            .navigationBarTitle("Characters", displayMode: .large)
        }
        .onAppear {
            viewModel.fetchCharacters()
        }
    }
}
#Preview {
    CharactersView()
}
