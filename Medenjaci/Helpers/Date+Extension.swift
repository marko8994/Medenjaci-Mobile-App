//
//  Date+Extension.swift
//  Medenjaci
//
//  Created by Marko Mladenovic on 02/02/2021.
//

import Foundation

extension Date {
    
    func shortDate() -> String {
        let formater = DateFormatter()
        formater.dateStyle = .medium
        formater.dateFormat = "d/MM/y"
        return formater.string(from: self)
    }
    
    static func date(from dateString: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.date(from: dateString) ?? Date()
    }
    
}
