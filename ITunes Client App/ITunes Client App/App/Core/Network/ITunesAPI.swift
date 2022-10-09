//
//  ITunesAPI.swift
//  ITunes Client App
//
//  Created by Ehlullah Karakurt on 9.10.2022.
//

import UIKit

final class iTunesAPI {
    static let shared = iTunesAPI()
    
    private let baseUrl: URL = URL(string: "https://itunes.apple.com/search")!
    
    func fetchPodcasts(completion: @escaping (PodcastResponse?,Error?) -> Void) {
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        let url = baseUrl.appending(queryItems: [URLQueryItem(name: "term", value: "podcast")])
        let request = URLRequest(url: url)
        let dataTask = session.dataTask(with: request) {data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                return
            }
            let podcastResponse = try? JSONDecoder().decode(PodcastResponse.self, from: data)
            completion(podcastResponse, nil)
        }
        dataTask.resume()
    }
    
    func downloadImage(from url: URL?, completion: @escaping (UIImage?,Error?) -> Void) {
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        guard let url = url else {
            return
        }
        let request = URLRequest(url: url)
        let dataTask = session.dataTask(with: request) {data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                return
            }
            let image = UIImage(data: data)
            completion(image, nil)
        }
        dataTask.resume()
    }
}
