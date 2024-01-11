//
//  CommonInjections.swift
//  BGitaIl
//
//  Created by Иван Легенький on 10.01.2024.
//

import Foundation
import NetworkManager
import Swinject

final class LoggerInjection {
    static let shared = LoggerInjection()
    var container: Container {
        get {
            if _container == nil {
                _container = buildContainer()
            }
            return _container!
        }
        set {
            _container = newValue
        }
    }

    private var _container: Container?

    private func buildContainer() -> Container {
        let container = Container()
        container.register(LoggerType.self) { _ in
            Logger()
        }
        container.register(AnalyticsManagerProtocol.self) { _ in
            AnalyticsManager(logger: FirebaseAnalyticsManager())
        }

        container.register(AppNetworkManagerProtocol.self) { _ in
            AppNetworkManager(network: NM())
        }

        return container
    }
}

@propertyWrapper struct Injected<Dependency> {
    var wrappedValue: Dependency

    init() {
        guard let resolvedDependency = LoggerInjection.shared.container.resolve(Dependency.self) else {
            fatalError("Залежність \(Dependency.self) не зареєстрована.")
        }
        wrappedValue = resolvedDependency
    }
}
