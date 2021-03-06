//
//  CatalogueElementsViewController.swift
//  MVPCatalogueApp
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 30/06/21.
//

import UIKit

class CatalogueElementsViewController: UIViewController {
        
    @IBOutlet weak var catalogueTableView: UITableView!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    private let catalogueElementsPresenter = CatalogueElementsPresenter()
    
    var listOfElements = [CatalogueItemModel]()
    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewConfig()
        searchBarConfig()
        catalogueElementsPresenter.setViewDelegate(catalogueElementsViewDelegate: self)
    }
    
    private func tableViewConfig() {
        catalogueTableView.delegate = self
        catalogueTableView.dataSource = self
        catalogueTableView.register(CatalogueElementsViewCell.nib(), forCellReuseIdentifier: CatalogueElementsViewCell.identifier)
        catalogueTableView.rowHeight = UITableView.automaticDimension
        catalogueTableView.estimatedRowHeight = 138
    }
    
    private func searchBarConfig() {
        navigationItem.title = "Search screen"
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
//        searchController.searchResultsUpdater = self
    }
}

extension CatalogueElementsViewController: CatalogueElementsViewDelegate {
    
    func displayElements(_ catalogueElements: [CatalogueItemModel]) {
        self.listOfElements = catalogueElements
        DispatchQueue.main.async {
            self.catalogueTableView.reloadData()
            self.loader.stopAnimating()
            self.catalogueTableView.isHidden = false
        }
    }
}

extension CatalogueElementsViewController: UISearchBarDelegate {
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        guard let text = searchController.searchBar.text, text != String() else {
            return
        }
        catalogueElementsPresenter.loadCatalogueElements(with: text)
        searchController.isActive = false
        catalogueTableView.isHidden = true
        loader.startAnimating()
    }
}

extension CatalogueElementsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfElements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let catalogueCell = catalogueTableView.dequeueReusableCell(withIdentifier: CatalogueElementsViewCell.identifier) as! CatalogueElementsViewCell
        catalogueCell.configure(with: listOfElements[indexPath.row])
        return catalogueCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = CatalogueElementDetailViewController(catalogueItemModel: listOfElements[indexPath.row])
        navigationController?.pushViewController(viewController, animated: true)
    }
}

//extension CatalogueElementsViewController: UISearchResultsUpdating {
//
//    func updateSearchResults(for searchController: UISearchController) {
//        guard let text = searchController.searchBar.text else {
//            return
//        }
//        print(text)
//    }
//}
