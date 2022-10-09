//
//  ITunes_Client_AppApp.swift
//  ITunes Client App
//
//  Created by Ehlullah Karakurt on 9.10.2022.
//

import SwiftUI

@main
struct ITunes_Client_AppApp: App {
    let coreDataManager = CoreDataManager.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, coreDataManager.container.viewContext)
        }
    }
}
