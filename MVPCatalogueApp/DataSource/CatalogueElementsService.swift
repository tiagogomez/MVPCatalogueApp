//
//  CatalogueElementsService.swift
//  MVPCatalogueApp
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 30/06/21.
//

import Foundation

enum CatalogueServiceError: Error {
    
    case defaultError
    case anotherError
}

struct CatalogueRequest {
    
    private let resourceURL: URL
    private let api_key = "String"
    
    init(site_id: String, category_id: String) {
        let resourceString = "https://api.mercadolibre.com/sites/\(site_id)/search?category=\(category_id)"
        guard let resourceURL = URL(string: resourceString) else {
            fatalError()
        }
        self.resourceURL = resourceURL
    }
    
    func getCatalogueElements(completion: @escaping(Result<[CatalogueItemModel], CatalogueServiceError>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: resourceURL) { data, _, _ in
            guard let jsonData = data else {
                completion(.failure(.defaultError))
                return
            }
            do {
                let decoder = JSONDecoder()
                let catalogueResponse = try decoder.decode(CatalogueResult.self, from: jsonData)
                let catalogueItems = catalogueResponse.results
                completion(.success(catalogueItems))
            } catch {
                completion(.failure(.anotherError))
            }
        }
        
        dataTask.resume()
    }
}
