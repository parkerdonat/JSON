//
//  UIImageViewExtension.swift
//  JSON
//
//  Created by Parker Donat on 9/18/17.
//  Copyright © 2017 Parker Donat. All rights reserved.
//

import UIKit

//NOTE: - This downloads images from web
extension UIImageView {
    
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit, placeHolder: UIImage? = nil) {
        guard let url = URL(string: link) else { return }
        download(from: url, contentMode: mode, placeholder: placeHolder)
    }
    
    func download(from url: URL, contentMode: UIViewContentMode = .scaleAspectFit, placeholder: UIImage? = nil, completionHandler: ((UIImage?) -> Void)? = nil) {
        
        image = placeholder
        self.contentMode = contentMode
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else {
                    completionHandler?(nil)
                    return
            }
            DispatchQueue.main.async() { () -> Void in
                self.image = image
                completionHandler?(image)
            }
            }.resume()
    }
}
