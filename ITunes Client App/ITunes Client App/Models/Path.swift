//
//  Path.swift
//  ITunes Client App
//
//  Created by Ehlullah Karakurt on 9.10.2022.
//

import Foundation

enum Path {
    case search(_ query: SearchQuery)
    case lookup(_ query: LookupQuery)
    case image(_ url: URL)

    var queryToDictionary: [String: String] {
        switch self {
        case .search(let query):
            return query.toDictionary
        case .lookup(let query):
            return query.toDictionary
        case .image(_):
            return [:]
        }
    }
}
