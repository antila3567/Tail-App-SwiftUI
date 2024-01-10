//
//  BGitaIlApp.swift
//  BGitaIl
//
//  Created by Иван Легенький on 10.01.2024.
//

import SwiftUI

@main
struct BGitaIlApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @AppStorage("isFirstTime") var isFirstTime: Bool = true

    @StateObject var languageManager = LanguageManager()

    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            if isFirstTime {
                OnboardingView()
                    .environmentObject(languageManager)
                    .environment(\.locale, languageManager.locale)
            } else {
                BGTabView()
                    .environmentObject(languageManager)
                    .environment(\.locale, languageManager.locale)
            }
        }
    }
}
