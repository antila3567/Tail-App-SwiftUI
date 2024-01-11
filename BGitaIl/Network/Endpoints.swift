//
//  Endpoints.swift
//  BGitaIl
//
//  Created by Иван Легенький on 11.01.2024.
//

import Foundation

enum Endpoints {
    case chapters
    case chapter(chapterNumber: String)
    case verses(chapterNumber: String)
    case verse(chapterNumber: String, verseNumber: String)
}

extension Endpoints {
    var path: String {
        switch self {
        case .chapters:
            return "v2/chapters/"
        case let .chapter(chapterNumber):
            return "v2/chapters/\(chapterNumber)"
        case let .verses(chapterNumber):
            return "v2/chapters/\(chapterNumber)/verses/"
        case let .verse(chapterNumber, verseNumber):
            return "v2/chapters/\(chapterNumber)/verses/\(verseNumber)"
        }
    }
}
