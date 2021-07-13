//
//  CatalogueElementDetailViewController.swift
//  MVPCatalogueApp
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 13/07/21.
//

import UIKit

class CatalogueElementDetailViewController: UIViewController {

    @IBOutlet weak var elementImageView: UIImageView!
    @IBOutlet weak var elementTitleLabel: UILabel!
    @IBOutlet weak var elementPriceLabel: UILabel!
    
    private let catalogueElementDetailPresenter = CatalogueElementDetailPresenter()
    private let catalogueItemModel: CatalogueItemModel
    
    init(catalogueItemModel: CatalogueItemModel) {
        self.catalogueItemModel = catalogueItemModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        catalogueElementDetailPresenter.setViewDelegate(catalogueElementDetailDelegate: self)
        catalogueElementDetailPresenter.loadCatalogueElement(catalogueItemModel)
    }
}

extension CatalogueElementDetailViewController: CatalogueElementDetailDelegate {
    
    func displayElement(with title: String, and price: Double) {
        self.elementTitleLabel.text = title
        self.elementPriceLabel.text = String(price)
    }
    
    func displayElementImage(_ image: UIImage) {
        self.elementImageView.image = image
    }
}
