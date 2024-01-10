//
//  BGitaIlApp.swift
//  BGitaIl
//
//  Created by Иван Легенький on 10.01.2024.
//

import SwiftUI

@main
struct BGitaIlApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
