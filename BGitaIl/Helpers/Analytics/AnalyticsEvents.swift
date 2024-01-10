//
//  AnalyticsEvents.swift
//  BGitaIl
//
//  Created by Иван Легенький on 10.01.2024.
//

import Foundation

enum OnboardingEvents {
    case clickButtonEvent
    case nextButtonTapper(index: Int)
}

enum DashboardEvents {
    case clickButtonEvent
    case nextChapter(name: String)
}

extension OnboardingEvents: EventProtocol {
    var name: String {
        switch self {
        case .clickButtonEvent:
            return "click_button_event"
        case .nextButtonTapper:
            return "chapter_tapped"
        }
    }

    var param: [String: Any] {
        switch self {
        case .clickButtonEvent:
            return [:]
        case let .nextButtonTapper(index):
            return ["index": index]
        }
    }
}

extension DashboardEvents: EventProtocol {
    var name: String {
        switch self {
        case .clickButtonEvent:
            return "click_button_event"
        case .nextChapter:
            return "chapter_tapped"
        }
    }

    var param: [String: Any] {
        switch self {
        case .clickButtonEvent:
            return [:]
        case let .nextChapter(name):
            return ["name": name]
        }
    }
}
