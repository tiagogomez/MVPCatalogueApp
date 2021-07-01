//
//  CatalogueElementsPresenter.swift
//  MVPCatalogueApp
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 30/06/21.
//

import Foundation

protocol CatalogueElementsViewDelegate: NSObjectProtocol {
    
    func displayElements()
}

class CatalogueElementsPresenter {
    weak private var catalogueElementsViewDelegate: CatalogueElementsViewDelegate?
    
    func setViewDelegate(catalogueElementsViewDelegate: CatalogueElementsViewDelegate?) {
        self.catalogueElementsViewDelegate = catalogueElementsViewDelegate
    }
    
    func presentCatalogueElements() {
        self.catalogueElementsViewDelegate?.displayElements()
    }
}
