//
//  CatalogueItemModel.swift
//  MVPCatalogueApp
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 30/06/21.
//

import Foundation

struct Wrapper<T: Decodable>: Decodable {
    
    var results: [T]
}

struct CatalogueItemModel: Codable {
    
    var title: String
    var id: String
    var price: Double
    var thumbnail: String
}
