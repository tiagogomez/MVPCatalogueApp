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
        let cell = UITableViewCell()
        cell.textLabel?.text = listOfElements[indexPath.row].title

        return cell
    }
    
    
}
