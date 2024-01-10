//
//  LanguageManager.swift
//  BGitaIl
//
//  Created by Иван Легенький on 10.01.2024.
//
import Combine
import Foundation

class LanguageManager: ObservableObject {
    enum Constants: String {
        case languageKey = "language-key"
    }

    @Published var locale: Locale = .current {
        didSet {}
    }

    init() {
        setupInitialLocale()
    }

    private func setupInitialLocale() {
        if let language = UserDefaults.standard.string(forKey: Constants.languageKey.rawValue),
           let value = SupportedLanguage(rawValue: language)
        {
            setLocale(language: value)
        } else {
            guard let currentLanguage = UserDefaults.standard.string(forKey: Constants.languageKey.rawValue) else { return }

            if currentLanguage.contains("uk") {
                setLocale(language: .ukrainian)
            } else {
                setLocale(language: .english)
            }
        }
    }

    func setLocale(language: SupportedLanguage) {
        switch language {
        case .english:
            locale = Locale(identifier: "en")
            UserDefaults.standard.setValue(SupportedLanguage.english.rawValue, forKey: Constants.languageKey.rawValue)
            UserDefaults.standard.synchronize()
        case .ukrainian:
            locale = Locale(identifier: "uk")
            UserDefaults.standard.setValue(SupportedLanguage.ukrainian.rawValue, forKey: Constants.languageKey.rawValue)
            UserDefaults.standard.synchronize()
        }
    }
}
