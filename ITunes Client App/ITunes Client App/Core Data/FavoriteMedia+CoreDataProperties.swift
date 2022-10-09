//
//  FavoriteMedia+CoreDataProperties.swift
//  ITunes Client App
//
//  Created by Ehlullah Karakurt on 9.10.2022.
//

import Foundation
import CoreData


extension favoriteMedia {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<favoriteMedia> {
        return NSFetchRequest<favoriteMedia>(entityName: "FavoriteMedia")
    }

    @NSManaged public var id: String
    @NSManaged public var title: String
    @NSManaged public var type: String
    @NSManaged public var image: String?
    @NSManaged public var createdAt: Date

    var mediaType: MediaType? {
        get {
            MediaType(rawValue: type) ?? nil
        }
        set {
            if let newValue = newValue {
                type = newValue.rawValue
            }
        }
    }

    public override func awakeFromInsert() {
        super.awakeFromInsert()

        setPrimitiveValue(Date(), forKey: #keyPath(favoriteMedia.createdAt))
    }
}

extension favoriteMedia : Identifiable {

}
