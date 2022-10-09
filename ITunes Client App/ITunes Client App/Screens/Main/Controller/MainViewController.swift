//
//  MainViewController.swift
//  ITunes Client App
//
//  Created by Ehlullah Karakurt on 9.10.2022.
//

import UIKit

final class MainViewController: UIViewController {
    
    // MARK: - Properties
    private let mainView = MainView()
    private var podcastResponse: PodcastResponse? {
        didSet{
            mainView.refresh()
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        
        mainView.setCollectionViewDelegate(self, andDataSource: self)
        fetchPodcasts()
    }
    
    // MARK: - Methods
    private func fetchPodcasts() {
        iTunesAPI.shared.fetchPodcasts() {response, error in
            if let error = error {
                fatalError(error.localizedDescription)
            }
            guard let _ = response else {
                return
            }
            self.podcastResponse = response
        }
    }
}

// MARK: - UICollectionViewDelegate
extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(indexPath.row)")
    }
}

// MARK: - UICollectionViewDataSource
extension MainViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        podcastResponse?.results?.count ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PodcastCollectionViewCell
        let podcast = podcastResponse?.results?[indexPath.row]
        cell.title = podcast?.trackName
        iTunesAPI.shared.downloadImage(from: podcast?.artworkLarge) {image,
            error in
            if let error = error {
                fatalError(error.localizedDescription)
            }
            cell.image = image
            DispatchQueue.main.async {
                collectionView.reloadItems(at: <#T##[IndexPath]#>)
            }
        }
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        guard let cell = cell as? PodcastCollectionViewCell else {
//            return
//        }
//        let podcast = podcastResponse?.results?[indexPath.row]
//        iTunesAPI.shared.downloadImage(from: podcast?.artworkLarge) {image,
//            error in
//            if let error = error {
//                fatalError(error.localizedDescription)
//            }
//            cell.image = image
//            DispatchQueue.main.async {
//                collectionView.reloadItems(at: <#T##[IndexPath]#>)
//            }
//        }
//    }
}
