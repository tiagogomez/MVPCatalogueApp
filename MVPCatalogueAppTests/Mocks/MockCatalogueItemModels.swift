//
//  MockCatalogueItemModels.swift
//  MVPCatalogueAppTests
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 23/07/21.
//

import Foundation

class MockCatalogueItemModels {
    
    static func defaultCatalogueItemModels() -> [CatalogueItemModel] {
        let catalogueItem = CatalogueItemModel(title: "mockTitle",
                                               id: "mockID",
                                               price: 1,
                                               thumbnail: "mockURL")
        return [catalogueItem]
    }
}
