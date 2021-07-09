//
//  CatalogueResource.swift
//  MVPCatalogueApp
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 6/07/21.
//

import Foundation

enum CatalogueServiceError: Error {
    
    case defaultError
    case anotherError
}

struct CatalogueResource: APIResource {
    
    typealias ModelType = CatalogueItemModel
    var url: URL
    
    init(site_id: String, category_id: String) {
        let resourceString = "https://api.mercadolibre.com/sites/\(site_id)/search?category=\(category_id)"
        guard let resourceURL = URL(string: resourceString) else {
            fatalError()
        }
        self.url = resourceURL
    }
}
