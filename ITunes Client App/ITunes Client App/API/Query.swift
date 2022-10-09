//
//  Query.swift
//  ITunes Client App
//
//  Created by Ehlullah Karakurt on 9.10.2022.
//

import Foundation

protocol Query {
    var toDictionary: [String: String] { get }
}
