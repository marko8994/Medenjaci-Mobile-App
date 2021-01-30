//
//  Category.swift
//  Medenjaci
//
//  Created by Marko Mladenovic on 30/01/2021.
//

import Foundation

public struct Category: Codable {
    let name: String
    let products: [LightProduct]
}
