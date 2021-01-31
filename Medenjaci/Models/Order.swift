//
//  Order.swift
//  Medenjaci
//
//  Created by Marko Mladenovic on 31/01/2021.
//

import Foundation

enum OrderStatus: String, Codable {
    case pending
    case delivered
    case rejected
    
    var name: String {
        switch self {
        case .pending:
            return Strings.Common.pending
        case .delivered:
            return Strings.Common.delivered
        case .rejected:
            return Strings.Common.rejected
        }
    }
}

public struct Order: Decodable {
    let orderItems: [OrderItem]?
    let totalAmount: String
    let date: Date?
    let status: OrderStatus?
    let orderNotes: String?
}

public struct OrderItem: Decodable {
    let productName: String
    let quantity: Int
    let price: String
    let unitPrice: String
}
