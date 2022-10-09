//
//  ErrorResponse.swift
//  ITunes Client App
//
//  Created by Ehlullah Karakurt on 9.10.2022.
//

import Foundation

enum ErrorResponse: Error {
    var rawValue: String {
        switch self {
        case .invalidEndpoint:
            return "Invalid endpoint."
        case .responseNotFound:
            return "Response not found."
        case .dataNotFound:
            return "Data not found."
        case .invalidResponse:
            return "Invalid response."
        }
    }
    
    case invalidEndpoint
    case responseNotFound
    case dataNotFound
    case invalidResponse
}
