//
//  MediaDetailView.swift
//  ITunes Client App
//
//  Created by Ehlullah Karakurt on 9.10.2022.
//

import SwiftUI
import AVKit

struct MediaDetailView: View {
    var media: Media
    var imageData: Data

    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                VStack(alignment: .leading) {
                    Text(media.name)
                        .bold()
                        .font(.headline)

                    if let previewUrl = media.previewUrl {
                        AVVideoPlayer(player: AVPlayer(url: previewUrl))
                            .frame(width: proxy.size.width - 32, height: 250)
                            .padding([.bottom], 8)
                        detailsForVideo
                    } else {
                        HStack(spacing: 40) {
                            image
                            detailsWithImage
                        }
                    }

                    Divider()

                    Text("Description")
                        .font(.headline)
                        .padding([.top, .bottom], 8)

                    Text(media.description)
                        .padding([.bottom], 16)
                }
                .padding()
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    var detailsWithImage: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Price: ").bold() +
            Text(media.price)

            if #available(iOS 15.0, *) {
                Text("Published: ").bold() +
                Text(media.releaseDate.formatted(date: .abbreviated, time: .omitted))
            } else {
                Text("Published: ").bold() +
                Text(media.releaseDate.mediumDateStyle)
            }
            
            genres
        }
    }

    var detailsForVideo: some View {
        VStack(alignment: .leading, spacing: 10) {
            Divider()

            HStack(spacing: 10) {
                Text("Price: ").bold() +
                Text(media.price)

                if #available(iOS 15.0, *) {
                    Text("Published: ").bold() +
                    Text(media.releaseDate.formatted(date: .abbreviated, time: .omitted))
                } else {
                    Text("Published: ").bold() +
                    Text(media.releaseDate.mediumDateStyle)
                }
            }

            genres
        }
        .padding([.top], 8)
    }

    @ViewBuilder
    var image: some View {
        if let uiImage = UIImage(data: imageData) {
            Image(uiImage: uiImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 100)
        } else {
            ImagePlaceholderView()
        }
    }

    var genres: some View {
        Text("Genre(s): ").bold() +
        Text(media.genres.joined(separator: ", "))
    }
}

struct MediaDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MediaDetailView(media: Media.sampleData[0], imageData: Data())
    }
}
