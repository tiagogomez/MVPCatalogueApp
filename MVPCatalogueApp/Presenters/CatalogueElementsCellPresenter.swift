//
//  CatalogueElementsCellPresenter.swift
//  MVPCatalogueApp
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 8/07/21.
//

import UIKit

protocol CatalogueElementsCellDelegate: NSObjectProtocol {
    
    func displayElement(title: String, image: UIImage)
    
    func updateImage(image: UIImage)
}

class CatalogueElementsCellPresenter {
    
    weak private var catalogueElementsCellDelegate: CatalogueElementsCellDelegate?
    
    func setViewDelegate(catalogueElementsCellDelegate: CatalogueElementsCellDelegate?) {
        self.catalogueElementsCellDelegate = catalogueElementsCellDelegate
    }
    
    func loadCatalogueElement(_ element: CatalogueItemModel) {
        catalogueElementsCellDelegate?.displayElement(title: element.title,
                                                      image: UIImage())
        guard let imageURL = URL(string: element.thumbnail) else {
            fatalError()
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: imageURL) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.catalogueElementsCellDelegate?.updateImage(image: image)
                    }
                }
            }
        }
    }
}
