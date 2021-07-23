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

    typealias ResponseType = CatalogueItemModel
    var url: URL
    
    init(site_id: String, item_name: String) {

        let scheme = "https"
        let host = "api.mercadolibre.com"
        let path = "/sites/\(site_id)/search"
        let queryItem = URLQueryItem(name: "q", value: item_name)
        
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = path
        urlComponents.queryItems = [queryItem]
        
        guard let url = urlComponents.url else {
            fatalError()
        }
        self.url = url
    }
}
