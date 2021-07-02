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
        let catalogueRequest = CatalogueRequest(site_id: "MLA", category_id: "MLA1055")
        catalogueRequest.getCatalogueElements { [weak self] result in
            switch result {
            case .success(let catalogueElemets):
                print(catalogueElemets)
            case .failure(let error):
                print(error)
            }
        }
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
