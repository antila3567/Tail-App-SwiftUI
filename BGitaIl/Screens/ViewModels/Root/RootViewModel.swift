//
//  RootViewModel.swift
//  BGitaIl
//
//  Created by Иван Легенький on 10.01.2024.
//

import BGUtility
import Foundation

class RootViewModel: ObservableObject {
    @Injected private var logger: LoggerType
    @Injected private var analytics: AnalyticsManagerProtocol

    init(logger: LoggerType = Logger()) {
        self.logger = logger
    }

    func onApper() {
        analytics.logEvent(event: OnboardingEvents.clickButtonEvent)
        analytics.logEvent(event: DashboardEvents.nextChapter(name: "Chapre1000"))
//        FirebaseAnalyticsManager.shared.logEvent(name: "Text1", param: [:])
    }
}
