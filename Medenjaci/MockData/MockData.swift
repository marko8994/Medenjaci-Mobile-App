//
//  MockData.swift
//  Medenjaci
//
//  Created by Marko Mladenovic on 30/01/2021.
//

import Foundation

public class MockData {
    
    static let shared = MockData()
    
    lazy var currentUser: User? = nil
    
    lazy var currentOrder: Order? = nil
    
    // Users
    var userOne = User(name: "Marko Mladenovic", email: "mmladenovic@gmail.com", address: "Strumicka 11, Beograd",
                       phoneNumber: "+38162490867", password: "Fewfewfew1")
    
    var userTwo = User(name: "Petar Petrovic", email: "ppetrovic@gmail.com", address: "Svetozara Markovica 9, Beograd",
                       phoneNumber: "+38162491800", password: "Petar123")
    
    var userThree = User(name: "Nikola Nikolic", email: "nnikolic@gmail.com", address: "Vojislava Ilica 4, Beograd",
                         phoneNumber: "+38162400890", password: "Nidza123")
    
    lazy var users = [userOne, userTwo, userThree]
    
    // Order items
    let orderItemsOne = [OrderItem(productName: "Acacia honey", quantity: 2, price: 24, unitPrice: 12),
                         OrderItem(productName: "Linden honey", quantity: 1, price: 10, unitPrice: 10)]
    let orderItemsTwo = [OrderItem(productName: "Propolis drops", quantity: 1, price: 5, unitPrice: 5),
                         OrderItem(productName: "Linden honey", quantity: 2, price: 20, unitPrice: 10)]
    let orderItemsTree = [OrderItem(productName: "Acacia honey", quantity: 1, price: 12, unitPrice: 12),
                          OrderItem(productName: "Propolis syrup", quantity: 2, price: 16, unitPrice: 8)]
    
    // Orders
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
    
    lazy var previousOrders = [orderOne, orderTwo, orderThree]
    
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
