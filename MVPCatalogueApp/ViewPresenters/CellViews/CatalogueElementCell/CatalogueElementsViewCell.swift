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
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    private let catalogueElementsCellPresenter = CatalogueElementsCellPresenter()
    
    func configure(with element: CatalogueItemModel) {
        clearCell()
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
    
    private func clearCell() {
        catalogueTitleLabel.text = String()
        catalogueImageView.image = UIImage()
        loader.startAnimating()
    }
}

extension CatalogueElementsViewCell: CatalogueElementsCellDelegate {
    
    func displayElement(title: String) {
        catalogueTitleLabel.text = title
    }
    
    func displayElementImage(image: UIImage) {
        loader.stopAnimating()
        catalogueImageView.image = image
    }
}
