//
//  ContentView.swift
//  ITunes Client App
//
//  Created by Ehlullah Karakurt on 9.10.2022.
//

import SwiftUI

struct ContentView: View {
    enum TabItem: String {
        case search, favorites
    }

    var body: some View {
        TabView {
            search
            favorites
        }
    }

    var search: some View {
        NavigationView {
            SearchView()
                .navigationTitle("Search")
                .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .tabItem {
            Image(systemName: "magnifyingglass")
            Text("Search")
        }
        .tag(TabItem.search)
    }

    var favorites: some View {
        NavigationView {
            FavoritesView()
                .navigationTitle("Favorites")
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .tabItem {
            Image(systemName: "star")
            Text("Favorites")
        }
        .tag(TabItem.favorites)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
