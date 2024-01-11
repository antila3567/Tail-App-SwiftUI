//
//  Headers.swift
//  BGitaIl
//
//  Created by Иван Легенький on 11.01.2024.
//

import Foundation

enum Headers {
    static var defaultHeaders: [String: String] {
        let headers: [String: String] = [
            "Content-Type": "application/json",
            "Accept": "application/json",
            "X-RapidAPI-Key": ConfigurationManager.shared.rapidAPIKey,
            "X-RapidAPI-Host": ConfigurationManager.shared.rapidAPIHost,
        ]

        return headers
    }
}
