//
//  HomeViewModel.swift
//  BGitaIl
//
//  Created by Иван Легенький on 11.01.2024.
//

import Combine
import Foundation

class HomeViewModel: ObservableObject {
    @Published var chapters: Chapters = []
    @Published var isFetching: Bool = false
    
    private var cancellables = Set<AnyCancellable>()

    private let chaptersRepository: ChaptersRepository

    init(chaptersRepository: ChaptersRepository) {
        self.chaptersRepository = chaptersRepository
    }

    func fetchChapters() {
        isFetching = true
        cancellables.removeAll()

        chaptersRepository.fetchChapters()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    self.isFetching = false
                case .failure(let error):
                    self.isFetching = false
                }
            }, receiveValue: { chapters in
                self.chapters = chapters
            })
            .store(in: &cancellables)
    }

}
