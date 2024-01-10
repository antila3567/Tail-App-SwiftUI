//
//  AnalyticsManager.swift
//  BGitaIl
//
//  Created by Иван Легенький on 10.01.2024.
//

import Foundation

protocol EventProtocol {
    var name: String { get }
    var param: [String: Any] { get }
}

protocol AnalyticsEventLoggerProtocol {
    func initialize()
    func logEvent(event: EventProtocol)
}

protocol AnalyticsManagerProtocol {
    func logEvent(event: EventProtocol)
}

final class AnalyticsManager: AnalyticsManagerProtocol {
    private let logger: AnalyticsEventLoggerProtocol

    init(logger: AnalyticsEventLoggerProtocol) {
        self.logger = logger
    }

    func logEvent(event: EventProtocol) {
        logger.logEvent(event: event)
    }
}
