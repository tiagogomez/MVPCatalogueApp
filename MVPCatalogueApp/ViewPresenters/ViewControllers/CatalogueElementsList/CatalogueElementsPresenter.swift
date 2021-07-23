//
//  CatalogueElementsPresenter.swift
//  MVPCatalogueApp
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 30/06/21.
//

import Foundation

protocol CatalogueElementsViewDelegate: NSObjectProtocol {
    
    func displayElements(_ catalogueElements: [CatalogueItemModel])
}

class CatalogueElementsPresenter {
    
    weak private var catalogueElementsViewDelegate: CatalogueElementsViewDelegate?
    private var serviceManager: ServiceManagerProtocol
    
    init(serviceManager: ServiceManagerProtocol = ServiceManager()) {
        self.serviceManager = serviceManager
    }
    
    func setViewDelegate(catalogueElementsViewDelegate: CatalogueElementsViewDelegate?) {
        self.catalogueElementsViewDelegate = catalogueElementsViewDelegate
    }
    
    func loadCatalogueElements(with itemName: String) {
        let catalogueResource = serviceManager.buildCatalogueAPIResource(with: itemName)
        serviceManager.executeCatalogueAPICall(with: catalogueResource,
                                                completion: { [weak self] result in
                                                    self?.catalogueElementsViewDelegate?.displayElements(result ?? [])
        })
    }
}
