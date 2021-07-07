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
    
    func configure(title: String, imageName: String) {
        catalogueTitleLabel.text = title
        catalogueImageView.image = UIImage(systemName: imageName)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        catalogueImageView.contentMode = .scaleAspectFit
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
