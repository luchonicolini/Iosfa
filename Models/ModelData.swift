//
//  ModelData.swift
//  Definitiva
//
//  Created by Luciano Nicolini on 30/10/2023.
//

import Foundation
import Combine

@Observable
class ModelData {
    var landmarks: [Model] = load("iosfa.json")
    
    
    var categories: [String: [Model]] {
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

extension Model {
    func encode() -> Data? {
        let encoder = JSONEncoder()
        do {
            return try encoder.encode(self)
        } catch {
            fatalError("Couldn't encode landmark:\n\(error)")
        }
    }
}
