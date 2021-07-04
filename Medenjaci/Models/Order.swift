//
//  Order.swift
//  Medenjaci
//
//  Created by Marko Mladenovic on 31/01/2021.
//

import Foundation

enum OrderStatus: String, Decodable {
    case pending
    case approved
    case rejected
    
    var name: String {
        switch self {
        case .pending:
            return Strings.Common.pending
        case .approved:
            return Strings.Common.approved
        case .rejected:
            return Strings.Common.rejected
        }
    }
}

public struct Order: Decodable {
    let uid: Int
    var orderItems: [OrderItem]
    var totalAmount: Int
    var date: Date?
    var status: OrderStatus?
    var orderNotes: String?
    var rejectionReason: String?
    let arrivalEstimate: Int?
}

public struct OrderItem: Decodable {
    let productName: String
    let quantity: Int
    let price: Int
    let unitPrice: Int
}
