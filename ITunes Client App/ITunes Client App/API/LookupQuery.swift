//
//  LookupQuery.swift
//  ITunes Client App
//
//  Created by Ehlullah Karakurt on 9.10.2022.
//

import Foundation

struct LookupQuery: Query {
    var id: String

    var toDictionary: [String: String] {
        return [
            "id": id
        ]
    }
}
