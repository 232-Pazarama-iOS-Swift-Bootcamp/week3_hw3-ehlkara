//
//  FavoritesView.swift
//  ITunes Client App
//
//  Created by Ehlullah Karakurt on 9.10.2022.
//

import SwiftUI
import CoreData

struct FavoritesView: View {
    @FetchRequest private var favorites: FetchedResults<favoriteMedia>
    private var rows: [GridItem] = Array(
        repeating: .init(.fixed(45), spacing: 20, alignment: .leading),
        count: 3
    )

    init() {
        let request = favoriteMedia.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \favoriteMedia.id, ascending: true)]
        request.fetchLimit = 1
        _favorites = FetchRequest(fetchRequest: request)
    }

    var body: some View {
        if favorites.count == 0 {
            Text("No favorites found.")
        } else {
            ScrollView(showsIndicators: false) {
                FavoritesGridView(rows: rows, type: .ebook)
                FavoritesGridView(rows: rows, type: .movie)
                FavoritesGridView(rows: rows, type: .podcast)
            }
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
            .environment(\.managedObjectContext, CoreDataManager.preview.container.viewContext)
    }
}
