//
//  SearchView.swift
//  RickMortyApp
//
//  Created by Bakar Kharabadze on 5/31/24.
//

import SwiftUI

//MARK: - SearchView
struct SearchView: View {
    
    @StateObject private var viewModel = SearchViewModel()
    @State private var searchText = ""
    @State private var selectedSegment = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                Picker("Search For", selection: $selectedSegment) {
                    Text("Characters").tag(0)
                    Text("Episodes").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                TextField("Search", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .padding(.top, -10)
                    .onChange(of: searchText) { _ in
                        viewModel.performSearch(selectedSegment: selectedSegment, searchText: searchText)
                    }
                    .onChange(of: selectedSegment) { _ in
                        viewModel.clearSearch()
                        searchText = ""
                    }
                
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 20) {
                        if selectedSegment == 0 {
                            ForEach(viewModel.getCharactersFiltered(searchText: searchText)) { character in
                                ZStack(alignment: .leading) {
                                    Color.white
                                        .cornerRadius(10)
                                        .shadow(color: .gray, radius: 5, x: 0, y: 2)
                                    
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text(character.name)
                                            .font(.headline)
                                        
                                        Text(character.status)
                                            .font(.subheadline)
                                            .foregroundColor(character.status == "Alive" ? .green : .red)
                                        
                                        Text(character.species)
                                            .font(.subheadline)
                                    }
                                    .padding()
                                }
                            }
                        } else {
                            ForEach(viewModel.getEpisodesFiltered(searchText: searchText)) { episode in
                                ZStack(alignment: .leading) {
                                    Color.white
                                        .cornerRadius(10)
                                        .shadow(color: .gray, radius: 5, x: 0, y: 2)
                                    
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text(episode.name)
                                            .font(.headline)
                                        
                                        Text("Episode: \(episode.episode)")
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                        
                                        Text("Aired on: \(episode.airDate)")
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                    }
                                    .padding()
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationBarTitle("Search")
        }
    }
}

#Preview {
    SearchView()
}
