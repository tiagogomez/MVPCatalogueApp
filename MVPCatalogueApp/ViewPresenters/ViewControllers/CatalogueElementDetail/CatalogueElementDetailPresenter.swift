//
//  CatalogueElementDetailPresenter.swift
//  MVPCatalogueApp
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 13/07/21.
//

import UIKit

protocol CatalogueElementDetailDelegate: NSObjectProtocol {
    
    func displayElement(with title: String, and price: Double)
    
    func displayElementImage(_ image: UIImage)
}

class CatalogueElementDetailPresenter {
    
    weak private var catalogueElementDetailDelegate: CatalogueElementDetailDelegate?
    
    func setViewDelegate(catalogueElementDetailDelegate: CatalogueElementDetailDelegate?) {
        self.catalogueElementDetailDelegate = catalogueElementDetailDelegate
    }
    
    func loadCatalogueElement(_ element: CatalogueItemModel) {
        guard let imageURL = URL(string: element.thumbnail) else {
            fatalError()
        }
        catalogueElementDetailDelegate?.displayElement(with: element.title, and: element.price)
        UIImageHelper.loadImageFrom(url: imageURL) { [weak self] image in
            self?.catalogueElementDetailDelegate?.displayElementImage(image)
        }
    }
}
