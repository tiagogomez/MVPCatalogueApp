//
//  CatalogueItemModel.swift
//  MVPCatalogueApp
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 30/06/21.
//

import Foundation

struct CatalogueResult: Codable {
    
    var results: [CatalogueItemModel]
}

struct CatalogueItemModel: Codable {
    
    var title: String
    var id: String
    var price: Double
}
