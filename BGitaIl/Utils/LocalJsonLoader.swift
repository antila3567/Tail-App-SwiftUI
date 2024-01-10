//
//  LocalJsonLoader.swift
//  BGitaIl
//
//  Created by Иван Легенький on 10.01.2024.
//

import Foundation

class LocalJsonLoader {
    func load<T: Decodable>(_ fileName: String, as _: T.Type = T.self) -> T? {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            return nil
        }

        do {
            let data = try Data(contentsOf: url)

            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            print("****\(error.localizedDescription)")
            return nil
        }
    }
}
