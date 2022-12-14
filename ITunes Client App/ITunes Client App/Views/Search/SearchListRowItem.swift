//
//  SearchListRowItem.swift
//  ITunes Client App
//
//  Created by Ehlullah Karakurt on 9.10.2022.
//

import SwiftUI

struct SearchListRowItem: View {
    var media: Media
    var imageData: Data

    var body: some View {
        NavigationLink {
            MediaDetailView(media: media, imageData: imageData)
        } label: {
            HStack(alignment: .top, spacing: 24) {
                if let data = imageData,
                   let uiImage = UIImage(data: data) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 100)
                } else {
                    ImagePlaceholderView()
                }

                VStack(alignment: .leading, spacing: 10) {
                    Text(media.name)
                        .font(.system(size: 18, weight: .semibold, design: .default))
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(2)

                    Text(media.description)
                        .lineLimit(4)
                }
            }
        }
        .buttonStyle(PlainButtonStyle())

    }
}

struct SearchListRowItem_Previews: PreviewProvider {
    static var previews: some View {
        SearchListRowItem(media: Media.singleMedia, imageData: Data())
    }
}
