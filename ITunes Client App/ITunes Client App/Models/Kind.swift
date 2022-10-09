//
//  Kind.swift
//  ITunes Client App
//
//  Created by Ehlullah Karakurt on 9.10.2022.
//

import Foundation

enum Kind: String {
    case ebook
    case movie = "movie"
    case podcast = "podcast"
    case software = "software"
    case music = "song"

    var mediaType: MediaType {
        switch self {
        case .ebook:
            return MediaType.ebook
        case .movie:
            return MediaType.movie
        case .podcast:
            return MediaType.podcast
        case .software:
            return MediaType.software
        case .music:
            return MediaType.music
        }
    }
}
