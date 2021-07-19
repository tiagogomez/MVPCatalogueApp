//
//  ServiceManager.swift
//  MVPCatalogueApp
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 16/07/21.
//

import Foundation

protocol ServiceManagerProtocol {
    
    func executeCatalogueAPICall(with resource: CatalogueResource,
                                 completion: @escaping ([CatalogueItemModel]?) -> Void)
}

class ServiceManager: ServiceManagerProtocol {
    
    var catalogueRequest: APIRequest<CatalogueResource>?
    
    func executeCatalogueAPICall(with resource: CatalogueResource,
                                 completion: @escaping ([CatalogueItemModel]?) -> Void) {
        catalogueRequest = APIRequest(resource: resource)
        catalogueRequest?.execute { (items) in
            completion(items)
        }
    }
}
