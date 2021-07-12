//
//  UIImageHelper.swift
//  MVPCatalogueApp
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 12/07/21.
//

import UIKit

final class UIImageHelper {
    
    static func loadImageFrom(url: URL, withCompletion completion: @escaping (UIImage) -> Void) {
        DispatchQueue.main.async {
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    completion(image)
                }
            }
        }
    }
}
