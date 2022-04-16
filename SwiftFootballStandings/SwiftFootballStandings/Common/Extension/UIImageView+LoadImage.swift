//
//  UIImageView+LoadImage.swift
//  SwiftFootballStandings
//
//  Created by Yegor Gorskikh on 15.04.2022.
//

import UIKit

var imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    
    func loadImage(urlString: String) {
        
        DispatchQueue.global().async { [weak self] in
            
            if let image = imageCache.object(forKey: urlString as NSString) as? UIImage {
                DispatchQueue.main.async {
                    self?.image = image
                    return
                }
            }
            if let url = URL(string: urlString) {
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        
                        DispatchQueue.main.sync {
                            imageCache.setObject(image, forKey: urlString as NSString)
                            self?.image = image
                        }
                    }
                }
            }
        }
        
    }
}

