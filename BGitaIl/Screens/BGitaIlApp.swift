//
//  BGitaIlApp.swift
//  BGitaIl
//
//  Created by Иван Легенький on 10.01.2024.
//

import Combine
import NetworkManager
import SwiftUI

@main
struct BGitaIlApp: App {
    @State private var cancellables = Set<AnyCancellable>()

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @AppStorage("isFirstTime") var isFirstTime: Bool = true

    @StateObject var languageManager = LanguageManager()

    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            if isFirstTime {
                OnboardingView()
                    .environmentObject(languageManager)
                    .environment(\.locale, languageManager.locale)
            } else {
                BGTabView()
                    .environmentObject(languageManager)
                    .environment(\.locale, languageManager.locale)
                    .onAppear {
//                        self.makeRequest()
                    }
            }
        }
    }

//    func makeRequest() {
//        guard let url = URL(string: "https://jsonplaceholder.typicode.com") else {
//            return
//        }
//
//        let builder = NMRequestBuilder(baseURL: url, path: "/posts/1")
//
//        builder.set(method: .get)
//
//        let network = NM()
//
//        do {
//            let response = try network.makeRequest(with: builder, type: WelcomeElement.self)
//
//            response.sink { completion in
//                switch completion {
//                case .finished:
//                    print("request is finished")
//                case let .failure(error):
//                    print("request is failed with \(error)")
//                }
//            } receiveValue: { value in
//                print("response: \(value)")
//            }
//            .store(in: &cancellables)
//        } catch {
//            print("error: \(error)")
//        }
//    }
}

struct WelcomeElement: Codable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}
