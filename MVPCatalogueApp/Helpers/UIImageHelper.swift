//
//  UIImageHelper.swift
//  MVPCatalogueApp
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 12/07/21.
//

import UIKit

final class UIImageHelper {
    
    static var imageCache = NSCache<NSString, UIImage>()
    
    static func loadImageFrom(url: URL, withCompletion completion: @escaping (UIImage) -> Void) {
        if let image = imageCache.object(forKey: url.absoluteString as NSString) {
            completion(image)
            return
        }
        DispatchQueue.main.async {
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    self.imageCache.setObject(image, forKey: url.absoluteString as NSString)
                    completion(image)
                }
            }
        }
    }
}
