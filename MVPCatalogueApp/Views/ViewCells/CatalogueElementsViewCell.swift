//
//  CatalogueElementsViewCell.swift
//  MVPCatalogueApp
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 7/07/21.
//

import UIKit

class CatalogueElementsViewCell: UITableViewCell {
    
    @IBOutlet weak var catalogueImageView: UIImageView!
    @IBOutlet weak var catalogueTitleLabel: UILabel!
    
    static let identifier = "CatalogueElementsViewCellId"
    static func nib() -> UINib {
        return UINib(nibName: "CatalogueElementsViewCell",
                     bundle: nil)
    }
    
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
    
    func displayElement(title: String, image: UIImage) {
        catalogueTitleLabel.text = title
        catalogueImageView.image = image
    }
    
    func updateImage(image: UIImage) {
        catalogueImageView.image = image
    }
}
