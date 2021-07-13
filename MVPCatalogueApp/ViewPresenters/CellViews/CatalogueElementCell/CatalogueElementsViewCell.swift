//
//  CatalogueElementsViewCell.swift
//  MVPCatalogueApp
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 7/07/21.
//

import UIKit

class CatalogueElementsViewCell: UITableViewCell {
    
    static let identifier = "CatalogueElementsViewCellId"
    
    static func nib() -> UINib {
        return UINib(nibName: "CatalogueElementsViewCell",
                     bundle: nil)
    }
    
    @IBOutlet weak var catalogueImageView: UIImageView!
    @IBOutlet weak var catalogueTitleLabel: UILabel!
    
    private let catalogueElementsCellPresenter = CatalogueElementsCellPresenter()
    
    func configure(with element: CatalogueItemModel) {
        catalogueElementsCellPresenter.setViewDelegate(catalogueElementsCellDelegate: self)
        catalogueElementsCellPresenter.loadCatalogueElement(element)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        catalogueImageView.contentMode = .scaleAspectFit
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension CatalogueElementsViewCell: CatalogueElementsCellDelegate {
    
    func displayElement(title: String) {
        catalogueTitleLabel.text = title
    }
    
    func displayElementImage(image: UIImage) {
        catalogueImageView.image = image
    }
}
