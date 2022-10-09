//
//  MediaType.swift
//  ITunes Client App
//
//  Created by Ehlullah Karakurt on 9.10.2022.
//

import Foundation

enum MediaType: String {
    case ebook, movie, podcast, software, music

    var title: String {
        switch self {

        case .ebook:
            return "Book"
        case .movie:
            return "Movie"
        case .podcast:
            return "Podcast"
        case .software:
            return "Software"
        case .music:
            return "Music"
        }
    }

    var entity: String {
        switch self {
        case .ebook:
            return "ebook"
        case .movie:
            return "movie"
        case .podcast:
            return "podcast"
        case .software:
            return "software"
        case .music:
            return "song"
        }
    }

    var id: String { self.rawValue }
}

extension MediaType: CaseIterable, Identifiable, Codable { }
