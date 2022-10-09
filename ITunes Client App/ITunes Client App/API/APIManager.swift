//
//  APIManager.swift
//  ITunes Client App
//
//  Created by Ehlullah Karakurt on 9.10.2022.
//

import Foundation

struct APIManager<Response>: APIRequest {
    var path: Path
    var urlSession: URLSession
}
