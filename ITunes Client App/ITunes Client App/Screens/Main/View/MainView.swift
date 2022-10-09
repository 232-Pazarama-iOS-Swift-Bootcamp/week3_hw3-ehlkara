//
//  MainView.swift
//  ITunes Client App
//
//  Created by Ehlullah Karakurt on 9.10.2022.
//

import UIKit

final class MainView: UIView {
    // MARK - Properties
    
    private lazy var flowLayout: UICollectionViewFlowLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 128.0, height: 128.0)
        return flowLayout
    }()
    
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    
    // MARK: - Init
    init(){
        super.init(frame: .zero)
        backgroundColor = .gray
        
        collectionView.register(PodcastCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        setupCollectionViewLayout()
    }
    required init(coder: NSCoder) {
        fatalError("initError: has not been implemented")
    }
    
    // MARK: - Methods
    private func setupCollectionViewLayout() {
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func setCollectionViewDelegate(_ delegate: UICollectionViewDelegate, andDataSource dataSource: UICollectionViewDataSource){
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
    }
    
    func refresh() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}
