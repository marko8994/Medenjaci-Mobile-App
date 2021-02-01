//
//  LightProduct.swift
//  Medenjaci
//
//  Created by Marko Mladenovic on 30/01/2021.
//

import Foundation

public struct LightProduct: Decodable {
    let uid: String
    let imageName: String
    let name: String
    let price: String
}

public struct Product: Decodable {
    let uid: String
    let imageName: String
    let name: String
    let description: String
    let usageDirections: String
    let price: String
}
