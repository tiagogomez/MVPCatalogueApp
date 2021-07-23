//
//  MockServiceManager.swift
//  MVPCatalogueApp
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 22/07/21.
//

import Foundation

class MockServiceManager: ServiceManagerProtocol {
    
    var mockItemsList: [CatalogueItemModel]?
    
    func buildCatalogueAPIResource(with itemName: String) -> CatalogueResource {
        return CatalogueResource(site_id: "mockID", item_name: itemName)
    }
    
    func executeCatalogueAPICall(with resource: CatalogueResource, completion: @escaping ([CatalogueItemModel]?) -> Void) {
        completion(mockItemsList)
    }
}
