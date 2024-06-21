//
//  Bundle-Decodable.swift
//  SwiftUI100Days
//
//  Created by Jhonnatan Macias on 4/06/24.
//

import Foundation

extension Bundle {
    func decode<T:Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("failed to locate \(file) in bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("failed to locate \(file) from bundle")
        }
        
        let decoder = JSONDecoder()
        let formater = DateFormatter()
        formater.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formater)
        
        do {
//            guard let loader = try? decoder.decode([String: Astronaut].self, from: data) else {
//                fatalError("failed to locate \(file) from bundle")
//            }
            return try decoder.decode(T.self, from: data)
        } catch  DecodingError.keyNotFound(let key, let context) {
            fatalError("failed to decode \(file) from bundle due to missing key \(key.stringValue) \(context.debugDescription)")
        } catch DecodingError.typeMismatch(_, let context) {
            fatalError("failed to decode \(file) from bundle due to type mismatch  \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context) {
            fatalError("failed to decode \(file) from bundle due to missing \(type) value  \(context.debugDescription) ")
        } catch DecodingError.dataCorrupted(let context) {
            fatalError("failed to decode \(file) from bundle due to appears to be a invalid JSON \(context.debugDescription) ")
        } catch {
            fatalError("failed to decode \(file) from bundle: \(error.localizedDescription)")
        }
        
        
    }
}
