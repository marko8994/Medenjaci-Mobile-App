//
//  MockData.swift
//  Medenjaci
//
//  Created by Marko Mladenovic on 30/01/2021.
//

import Foundation

public class MockData {
    
    static let shared = MockData()
    
    var currentUser: User = User(name: "Marko", email: "mmm@gmail.com", address: "Rimska",
                                 phoneNumber: "381612345678", password: "fewfewfew")
    
    lazy var currentOrder: Order? = nil
    
    let orderItemsOne: [OrderItem] = [OrderItem(productName: "Acacia honey", quantity: 2, price: 24, unitPrice: 12),
                                      OrderItem(productName: "Linden honey", quantity: 1, price: 10, unitPrice: 10)]
    let orderItemsTwo: [OrderItem] = [OrderItem(productName: "Propolis drops", quantity: 1, price: 5, unitPrice: 5),
                                      OrderItem(productName: "Linden honey", quantity: 2, price: 20, unitPrice: 10)]
    let orderItemsTree: [OrderItem] = [OrderItem(productName: "Acacia honey", quantity: 1, price: 12, unitPrice: 12),
                                      OrderItem(productName: "Propolis syrup", quantity: 2, price: 16, unitPrice: 8)]
    
    lazy var orderOne = Order(uid: 1, orderItems: orderItemsOne, totalAmount: 34,
                              date: Date.date(from: "25/10/2020"), status: .approved,
                              orderNotes: "Please pack all products separately",
                              rejectionReason: nil, arrivalEstimate: 3)
    
    lazy var orderTwo = Order(uid: 2, orderItems: orderItemsTwo, totalAmount: 25,
                              date: Date.date(from: "15/08/2020"), status: .rejected,
                              orderNotes: nil,
                              rejectionReason: "We don't have all products on stock. Please contact us for more info",
                              arrivalEstimate: nil)
    
    lazy var orderThree =  Order(uid: 3, orderItems: orderItemsTwo, totalAmount: 25,
                                 date: Date.date(from: "4/06/2021"), status: .approved,
                                 orderNotes: "Pack both botles of syrup separately",
                                 rejectionReason: nil, arrivalEstimate: 4)
    
    lazy var previousOrders: [Order] = [orderOne, orderTwo, orderThree]
    
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
    
}
