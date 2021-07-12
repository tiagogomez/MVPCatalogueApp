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
    private var request: APIRequest<CatalogueResource>?
    
    func setViewDelegate(catalogueElementsViewDelegate: CatalogueElementsViewDelegate?) {
        self.catalogueElementsViewDelegate = catalogueElementsViewDelegate
    }
    
    func loadCatalogueElements(with category: String) {
        let catalogueResource = CatalogueResource(site_id: "MCO", category_id: category)
        let catalogueRequest = APIRequest(resource: catalogueResource)
        self.request = catalogueRequest
        catalogueRequest.execute { [weak self] result in
            self?.catalogueElementsViewDelegate?.displayElements(result ?? [])
        }
    }
}
