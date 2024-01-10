//
//  OnboardingViewModel.swift
//  BGitaIl
//
//  Created by Иван Легенький on 10.01.2024.
//

import Foundation

class OnboardingViewModel: ObservableObject {
    @Published var onboardingData = [OnboardingModel]()

    private let localJsonLoader: LocalJsonLoader

    init() {
        localJsonLoader = LocalJsonLoader()
        loadOnboardingData()
    }

    func loadOnboardingData() {
        guard let response: [OnboardingModel] = localJsonLoader.load("Onboarding") else {
            return
        }

        onboardingData = response
    }
}
