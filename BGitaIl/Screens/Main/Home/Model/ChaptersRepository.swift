//
//  ChaptersRepository.swift
//  BGitaIl
//
//  Created by Иван Легенький on 11.01.2024.
//

import Combine
import Foundation
import NetworkManager

protocol ChaptersRepositoryProt {
    func fetchChapters() -> AnyPublisher<Chapters, APIError>
    func fetchChapter(chapterNumber: String) -> AnyPublisher<ChapterModel, APIError>
}

class ChaptersRepository: ChaptersRepositoryProt {
    @Injected private var networkManager: AppNetworkManagerProtocol

    func fetchChapters() -> AnyPublisher<Chapters, APIError> {
        guard let baseURL = URL(string: ConfigurationManager.shared.baseURL) else {
            return Fail(error: APIError.urlError).eraseToAnyPublisher()
        }
        
        let request = NMRequestBuilder(baseURL: baseURL, path: Endpoints.chapters.path)

        request.set(headers: Headers.defaultHeaders)
        request.set(method: .get)

        return networkManager.makeRequest(with: request, type: Chapters.self)
    }

    func fetchChapter(chapterNumber: String) -> AnyPublisher<ChapterModel, APIError> {
        guard let baseURL = URL(string: ConfigurationManager.shared.baseURL) else {
            return Fail(error: APIError.urlError).eraseToAnyPublisher()
        }

        let request = NMRequestBuilder(baseURL: baseURL, path: Endpoints.chapter(chapterNumber: chapterNumber).path)

        request.set(headers: Headers.defaultHeaders)
        request.set(method: .get)

        return networkManager.makeRequest(with: request, type: ChapterModel.self)
    }
}
