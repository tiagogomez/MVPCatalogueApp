//
//  MockCatalogueElementsView.swift
//  MVPCatalogueAppTests
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 23/07/21.
//

import Foundation

class MockCatalogueElementsView: NSObject, CatalogueElementsViewDelegate {
    
    var elements: [CatalogueItemModel] = []
    
    func displayElements(_ catalogueElements: [CatalogueItemModel]) {
        elements = catalogueElements
    }
}
