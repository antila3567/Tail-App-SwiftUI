//
//  FirebaseAnalyticsManager.swift
//  BGitaIl
//
//  Created by Иван Легенький on 10.01.2024.
//

import Firebase
import Foundation

final class FirebaseAnalyticsManager: AnalyticsEventLoggerProtocol {
    func initialize() {}

    func logEvent(event: EventProtocol) {
        Analytics.logEvent(event.name, parameters: event.param)
    }
}
