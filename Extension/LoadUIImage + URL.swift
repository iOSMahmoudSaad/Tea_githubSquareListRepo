//
//  LoadUIImage + URL.swift
//  Tea_githubSquareListRepo
//
//  Created by Mahmoud Saad on 16/06/2023.
//

import UIKit

var imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    
    func load(urlString: String) {
        
        guard let url = URL(string: urlString) else {return}
        
        if let image = imageCache.object(forKey: urlString as NSString) as? UIImage {
            self.image = image
            return
        }
        
        DispatchQueue.global().async { [weak self] in
            
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        imageCache.setObject(image, forKey: urlString as NSString)
                        self?.image = image
                    }
                }
            }
            
        }
    }
}
