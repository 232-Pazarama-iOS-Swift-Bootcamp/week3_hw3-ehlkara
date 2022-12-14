//
//  CoreDataManager.swift
//  ITunes Client App
//
//  Created by Ehlullah Karakurt on 9.10.2022.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()

    static let preview: CoreDataManager = {
        let manager = CoreDataManager(inMemory: true)
        let viewContext = manager.container.viewContext
        
        for number in 1...21 {
            let favorite = favoriteMedia(context: viewContext)
            favorite.id = "\(number)"
            favorite.title = "Long Title \(number) Random Headline Sub headline"
            favorite.image = nil

            if number <= 7 {
                favorite.mediaType = .ebook
            } else if number <= 14 {
                favorite.mediaType = .movie
            } else {
                favorite.mediaType = .podcast
            }
        }

        try? viewContext.save()

        return manager
    }()

    static let previewItem: favoriteMedia = {
        let fav = favoriteMedia(context: CoreDataManager.preview.container.viewContext)
        fav.title = "This is a longish title."
        return fav
    }()

    let container: NSPersistentContainer

    private init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "MediaSearch")

        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }

        container.loadPersistentStores { [weak self] storeDescription, error in
            guard error == nil else { return }
            print("storeDesc", storeDescription)

            self?.container.viewContext.automaticallyMergesChangesFromParent = true
            self?.container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        }
    }

}
