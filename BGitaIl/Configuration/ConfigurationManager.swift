//
//  ConfigurationManager.swift
//  BGitaIl
//
//  Created by Иван Легенький on 10.01.2024.
//

import Foundation

private enum BuildConfiguration {
    enum Error: Swift.Error {
        case missingKey
        case invalidValue
    }

    static func value<T>(for key: String) throws -> T where T: LosslessStringConvertible {
        guard let object = Bundle.main.object(forInfoDictionaryKey: key) else {
            throw Error.missingKey
        }

        switch object {
        case let string as String:
            guard let value = T(string) else { fallthrough }
            return value
        default:
            throw Error.invalidValue
        }
    }
}

final class ConfigurationManager {
    static let shared = ConfigurationManager()

    var rapidAPIKey: String!
    var rapidAPIHost: String!
    var baseURL: String! {
        guard let url = url else {
            return nil
        }
        return "https://\(url)"
    }


    private var url: String!

    private init() {
        setupValues()
    }

    private func setupValues() {
        do {
            url = try BuildConfiguration.value(for: "BASE_URL")
            rapidAPIKey = try BuildConfiguration.value(for: "X_RapidAPI_Key")
            rapidAPIHost = try BuildConfiguration.value(for: "X_RapidAPI_Host")
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}

enum Configuration {
    enum Environment {
        case dev
        case qa
        case prod
    }

    static var environment: Environment {
        #if DEV
            return .dev
        #elseif QA
            return .qa
        #elseif PROD
            return .prod
        #endif
    }
}
