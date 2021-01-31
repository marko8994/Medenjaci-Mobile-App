//
//  MockData.swift
//  Medenjaci
//
//  Created by Marko Mladenovic on 30/01/2021.
//

import Foundation

public class MockData {
    
    static let shared = MockData()
    
    var currentOrder: Order?
    
    func loadData<T: Decodable>(_ filename: String) -> T {
        let data: Data
        guard let file = Bundle.main.url(forResource: filename, withExtension: "json") else {
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
    
    func loadArrayData<T: Decodable>(_ filename: String) -> [T] {
        let data: Data
        guard let file = Bundle.main.url(forResource: filename, withExtension: "json") else {
                fatalError("Couldn't find \(filename) in main bundle.")
        }
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }
        do {
            let decoder = JSONDecoder()
            let dateFormater = DateFormatter()
            dateFormater.dateStyle = .medium
            dateFormater.dateFormat = "dd/MM/yyyy"
            dateFormater.locale = Locale.current
            dateFormater.timeZone = TimeZone.current
            decoder.dateDecodingStrategy = .formatted(dateFormater)
            return try decoder.decode([T].self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \([T].self):\n\(error)")
        }
    }
    
}
