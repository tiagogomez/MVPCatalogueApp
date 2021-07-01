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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        catalogueTableView.delegate = self
        catalogueTableView.dataSource = self
        catalogueElementsPresenter.setViewDelegate(catalogueElementsViewDelegate: self)
    }
}

extension CatalogueElementsViewController: CatalogueElementsViewDelegate {
    
    func displayElements() {
        
    }
}

extension CatalogueElementsViewController: UITableViewDelegate {
    
}

extension CatalogueElementsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "test"
        return cell
    }
    
    
}
