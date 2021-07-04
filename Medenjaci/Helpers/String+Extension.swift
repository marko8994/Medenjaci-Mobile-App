//
//  String+Extension.swift
//  Medenjaci
//
//  Created by Marko Mladenovic on 4.7.21..
//

import Foundation

extension String {
    
    var isValidName: Bool {
        let trimmedValue = self.trimmingCharacters(in: .whitespaces)
        guard trimmedValue.count > 5 && trimmedValue.count < 30 else {
            return false
        }
        return true
    }
    
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPredicate.evaluate(with: self.trimmingCharacters(in: .whitespaces))
    }
    
    var isValidAddress: Bool {
        let trimmedValue = self.trimmingCharacters(in: .whitespaces)
        guard trimmedValue.count > 5 && trimmedValue.count < 50 else {
            return false
        }
        return true
    }
    
    var isValidPhoneNumber: Bool {
        let phoneNumberRegEx = "^\\+(?:[0-9]?){6,14}[0-9]$"
        let phonePredicate = NSPredicate(format: "SELF MATCHES[c] %@", phoneNumberRegEx)
        return phonePredicate.evaluate(with: self.trimmingCharacters(in: .whitespaces))
    }
    
    var isValidPassword: Bool {
        let passwordRegEx = "^(?=.*[a-z])(?=.*[0-9])(?=.*[A-Z]).{8,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES[c] %@", passwordRegEx)
        return passwordPredicate.evaluate(with: self.trimmingCharacters(in: .whitespaces))
    }
}
