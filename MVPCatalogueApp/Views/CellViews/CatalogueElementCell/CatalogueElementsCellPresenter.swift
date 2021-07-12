//
//  CatalogueElementsCellPresenter.swift
//  MVPCatalogueApp
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 8/07/21.
//

import UIKit

protocol CatalogueElementsCellDelegate: NSObjectProtocol {
    
    func displayElement(title: String)
    
    func displayElementImage(image: UIImage)
}

class CatalogueElementsCellPresenter {
    
    weak private var catalogueElementsCellDelegate: CatalogueElementsCellDelegate?
    
    func setViewDelegate(catalogueElementsCellDelegate: CatalogueElementsCellDelegate?) {
        self.catalogueElementsCellDelegate = catalogueElementsCellDelegate
    }
    
    func loadCatalogueElement(_ element: CatalogueItemModel) {
        guard let imageURL = URL(string: element.thumbnail) else {
            fatalError()
        }
        catalogueElementsCellDelegate?.displayElement(title: element.title)
        UIImageHelper.loadImageFrom(url: imageURL) { [weak self] image in
            self?.catalogueElementsCellDelegate?.displayElementImage(image: image)
        }
    }
}
