//
//  AppNetworkManager.swift
//  BGitaIl
//
//  Created by Иван Легенький on 11.01.2024.
//

import Combine
import Foundation
import NetworkManager

protocol AppNetworkManagerProtocol {
    func makeRequest<T: Codable>(with builder: NMRequestBuilder, type: T.Type) -> AnyPublisher<T, APIError>
}

class AppNetworkManager: AppNetworkManagerProtocol {
    private let network: NMProtocol

    init(network: NMProtocol) {
        self.network = network
    }

    func makeRequest<T: Codable>(with builder: NMRequestBuilder, type: T.Type) -> AnyPublisher<T, APIError> {
        return network.makeRequest(with: builder, type: type)
    }
}
