//
//  APIRequest.swift
//  MVPCatalogueApp
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 30/06/21.
//

//https://matteomanferdini.com/network-requests-rest-apis-ios-swift/

import UIKit

protocol APIResource {
    
    associatedtype ResponseType: Decodable
    var url: URL { get }
}

protocol NetworkRequest {
    
    associatedtype T: Decodable
    
    func decode(_ data: Data) -> T?
    func execute(withCompletion completion: @escaping (T?) -> Void)
}

class APIRequest<Resource: APIResource>: NetworkRequest {
    
    let resource: Resource
    
    init(resource: Resource) {
        self.resource = resource
    }
    
    func decode(_ data: Data) -> [Resource.ResponseType]? {
        let decoder = JSONDecoder()
        let catalogueResponse = try? decoder.decode(Wrapper<Resource.ResponseType>.self, from: data)
        return catalogueResponse?.results
    }
    
    func execute(withCompletion completion: @escaping ([Resource.ResponseType]?) -> Void) {
        let task = URLSession.shared.dataTask(with: resource.url) { [weak self] (data, _ , _) -> Void in
            guard let data = data, let value = self?.decode(data) else {
                DispatchQueue.main.async { completion(nil) }
                return
            }
            DispatchQueue.main.async { completion(value) }
        }
        task.resume()
    }
}
