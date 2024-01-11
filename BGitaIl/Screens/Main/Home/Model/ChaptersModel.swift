//
//  ChaptersModel.swift
//  BGitaIl
//
//  Created by Иван Легенький on 11.01.2024.
//

import Foundation

struct ChapterModel: Codable, Identifiable {
    let id: Int
    let name, slug, nameTransliterated, nameTranslated: String
    let versesCount, chapterNumber: Int
    let nameMeaning, chapterSummary, chapterSummaryHindi: String

    enum CodingKeys: String, CodingKey {
        case id, name, slug
        case nameTransliterated = "name_transliterated"
        case nameTranslated = "name_translated"
        case versesCount = "verses_count"
        case chapterNumber = "chapter_number"
        case nameMeaning = "name_meaning"
        case chapterSummary = "chapter_summary"
        case chapterSummaryHindi = "chapter_summary_hindi"
    }
}

typealias Chapters = [ChapterModel]
