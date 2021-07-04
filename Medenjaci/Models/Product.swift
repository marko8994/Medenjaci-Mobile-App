//
//  LightProduct.swift
//  Medenjaci
//
//  Created by Marko Mladenovic on 30/01/2021.
//

import Foundation

public struct LightProduct: Decodable {
    let uid: Int
    let imageName: String
    let name: String
    let price: Int
}

public struct Product: Decodable {
    let uid: Int
    let imageName: String
    let name: String
    let description: String
    let usageDirections: String
    let price: Int
}
