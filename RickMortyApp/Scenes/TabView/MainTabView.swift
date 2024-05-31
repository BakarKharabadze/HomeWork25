//
//  MainTabView.swift
//  RickMortyApp
//
//  Created by Bakar Kharabadze on 5/31/24.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        //MARK: TabView
            TabView {
                CharactersView()
                    .tabItem {
                        Image(systemName: "figure.stand")
                        Text("Characters")
                    }
                EpisodesView()
                    .tabItem {
                        Image(systemName: "playpause")
                        Text("Episodes")
                    }
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                
            }.accentColor(.black)
            .background(Color.green)
                
    }
}
#Preview {
    MainTabView()
}
