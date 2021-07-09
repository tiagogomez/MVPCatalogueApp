//
//  CatalogueElementsViewController.swift
//  MVPCatalogueApp
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 30/06/21.
//

import UIKit

class CatalogueElementsViewController: UIViewController {
        
    @IBOutlet weak var catalogueTableView: UITableView!
    private let catalogueElementsPresenter = CatalogueElementsPresenter()
    
    var listOfElements = [CatalogueItemModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        catalogueTableView.delegate = self
        catalogueTableView.dataSource = self
        catalogueElementsPresenter.setViewDelegate(catalogueElementsViewDelegate: self)
        catalogueTableView.register(CatalogueElementsViewCell.nib(),
                                    forCellReuseIdentifier: CatalogueElementsViewCell.identifier)
        catalogueTableView.rowHeight = UITableView.automaticDimension
        catalogueTableView.estimatedRowHeight = 138
        catalogueElementsPresenter.loadCatalogueElements()
    }
}

extension CatalogueElementsViewController: CatalogueElementsViewDelegate {
    
    func displayElements(_ catalogueElements: [CatalogueItemModel]) {
        self.listOfElements = catalogueElements
        DispatchQueue.main.async {
            self.catalogueTableView.reloadData()
        }
    }
}

extension CatalogueElementsViewController: UITableViewDelegate {
    
}

extension CatalogueElementsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfElements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let catalogueCell = catalogueTableView.dequeueReusableCell(withIdentifier: CatalogueElementsViewCell.identifier) as! CatalogueElementsViewCell
        catalogueCell.configure(with: listOfElements[indexPath.row])
        return catalogueCell
    }
}
