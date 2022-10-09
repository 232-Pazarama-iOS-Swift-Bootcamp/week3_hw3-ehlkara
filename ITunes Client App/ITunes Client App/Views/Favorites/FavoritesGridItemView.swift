//
//  FavoritesGridItemView.swift
//  ITunes Client App
//
//  Created by Ehlullah Karakurt on 9.10.2022.
//

import SwiftUI

struct FavoritesGridItemView: View {
    var text: String
    
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: "photo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 44)
            Text(text)
                .bold()
                .lineLimit(2)
                .padding([.leading], 5)
            Spacer()

        }
        .frame(width: 250, height: 54)
        .padding([.leading, .trailing], 12)
    }
}

struct FavoritesGridItemView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesGridItemView(text: "Long Title 1 Random Headline Sub headline third")
    }
}
