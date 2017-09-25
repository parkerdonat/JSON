//
//  ImageView.swift
//  JSON
//
//  Created by Parker Donat on 9/20/17.
//  Copyright © 2017 Parker Donat. All rights reserved.
//

import UIKit

public class ImageView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var longPress: UILongPressGestureRecognizer!
    
    weak var delegate: ImageViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
      Bundle.main.loadNibNamed("ImageView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        let deleteImage = UIImage(named: "delete")
        let tintedImage = deleteImage?.withRenderingMode(.alwaysTemplate)
        closeButton.setImage(tintedImage, for: .normal)
        closeButton.tintColor = .red
        
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
    }
    
    @IBAction func longPressed(_ sender: UILongPressGestureRecognizer) {
        print("Long Pressed!")
        if let delegate = delegate {
            delegate.didlongPressedOnImage(self)
        }
    }
   
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        print("Close button pressed!")
        if let delegate = delegate {
            delegate.didTapCloseButton(self)
        }
    }
}

protocol ImageViewDelegate: class {
    func didlongPressedOnImage(_ sender: ImageView)
    func didTapCloseButton(_ sender: ImageView)
}
