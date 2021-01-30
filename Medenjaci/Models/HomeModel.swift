//
//  HomeModel.swift
//  Medenjaci
//
//  Created by Marko Mladenovic on 30/01/2021.
//

import Foundation

public struct HomeModel: Codable {
    let highlightedProductsImageNames: [String]?
    let categories: [Category]
}
