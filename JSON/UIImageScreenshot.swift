//
//  UIImageExtension.swift
//  JSON
//
//  Created by Parker Donat on 9/19/17.
//  Copyright © 2017 Parker Donat. All rights reserved.
//

import UIKit

//NOTE: - This takes a screenshot of the view for email attachment
extension UIImage {
    convenience init(view: UIView) {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.isOpaque, UIScreen.main.scale)
        view.drawHierarchy(in: view.bounds, afterScreenUpdates: false)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.init(cgImage: (image?.cgImage)!)
    }
}
