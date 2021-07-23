//
//  ServiceManager.swift
//  MVPCatalogueApp
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 16/07/21.
//

import Foundation

protocol ServiceManagerProtocol {
    
    func buildCatalogueAPIResource(with itemName: String) -> CatalogueResource

    func executeCatalogueAPICall(with resource: CatalogueResource,
                                 completion: @escaping ([CatalogueItemModel]?) -> Void)
}

class ServiceManager: ServiceManagerProtocol {
    
    let siteID = "MCO"
    var catalogueRequest: APIRequest<CatalogueResource>?
    
    func buildCatalogueAPIResource(with itemName: String) -> CatalogueResource {
        return CatalogueResource(site_id: siteID, item_name: itemName)
    }
    
    func executeCatalogueAPICall(with resource: CatalogueResource,
                                 completion: @escaping ([CatalogueItemModel]?) -> Void) {
        catalogueRequest = APIRequest(resource: resource)
        catalogueRequest?.execute { (items) in
            completion(items)
        }
    }
}
