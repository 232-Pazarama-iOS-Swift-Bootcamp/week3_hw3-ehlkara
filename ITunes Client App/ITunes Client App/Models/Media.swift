//
//  Media.swift
//  ITunes Client App
//
//  Created by Ehlullah Karakurt on 9.10.2022.
//

import Foundation

struct Media: Identifiable {
    var id: String
    var name: String
    var description: String
    var type: MediaType
    var genres: [String]
    var price: String
    var imageUrl: URL
    var previewUrl: URL?
    var releaseDate: Date
}

extension Media: Equatable {
    static func == (lhs: Media, rhs: Media) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Media: Codable {
    enum CodingKeys: String, CodingKey {
        case genres, releaseDate, description, previewUrl
        case id = "trackId"
        case name = "trackName"
        case type = "kind"
        case price = "formattedPrice"
        case imageUrl = "artworkUrl100"
    }

    enum AdditionalKeys: String, CodingKey {
        case longDescription
        case primaryGenreName
        case trackPrice
        case collectionId
        case collectionName
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let additionalContainer = try decoder.container(keyedBy: AdditionalKeys.self)

        if let id = try? container.decode(Int.self, forKey: .id) {
            self.id = String(id)
        } else {
            id = String(try additionalContainer.decode(Int.self, forKey: .collectionId))
        }

        if let name = try? container.decode(String.self, forKey: .name) {
            self.name = name
        } else {
            name = try additionalContainer.decode(String.self, forKey: .collectionName)
        }

        if let kind = try? container.decode(String.self, forKey: .type),
           let mediaKind = Kind(rawValue: kind) {
            type = mediaKind.mediaType
        } else {
            type = .ebook
        }

        imageUrl = try container.decode(URL.self, forKey: .imageUrl)
        previewUrl = (try? container.decode(URL.self, forKey: .previewUrl)) ?? nil
        releaseDate = try container.decode(Date.self, forKey: .releaseDate)

        if let description = try? container.decode(String.self, forKey: .description) {
            self.description = description.stripHTML()
        } else if let description = try? additionalContainer.decode(String.self, forKey: .longDescription) {
            self.description = description.stripHTML()
        } else {
            description = "No description."
        }

        if let genres = try? container.decode([String].self, forKey: .genres) {
            self.genres = genres
        } else if let genre = try? additionalContainer.decode(String.self, forKey: .primaryGenreName) {
            genres = [genre]
        } else {
            genres = []
        }

        if let price = try? container.decode(String.self, forKey: .price) {
            self.price = price
        } else if let price = try? additionalContainer.decode(String.self, forKey: .trackPrice) {
            self.price = price
        } else if let number = (try? additionalContainer.decode(Double.self, forKey: .trackPrice)) {
            self.price = "$\(number)"
        } else {
            price = ""
        }
    }
}
