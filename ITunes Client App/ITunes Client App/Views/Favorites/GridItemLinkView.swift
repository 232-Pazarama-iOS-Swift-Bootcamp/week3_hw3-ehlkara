//
//  GridItemLinkView.swift
//  ITunes Client App
//
//  Created by Ehlullah Karakurt on 9.10.2022.
//

import SwiftUI

struct GridItemLinkView: View {
    var item: favoriteMedia

    var body: some View {
        NavigationLink {
            Text("Detail \(item.id)")
        } label: {
            FavoritesGridItemView(text: item.title)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct GridItemLinkView_Previews: PreviewProvider {
    static var previews: some View {
        GridItemLinkView(item: CoreDataManager.previewItem)
    }
}
