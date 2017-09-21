//
//  ImageView.swift
//  JSON
//
//  Created by Parker Donat on 9/20/17.
//  Copyright © 2017 Parker Donat. All rights reserved.
//

import UIKit

public class ImageView: UIImageView {

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var closeButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func commonInit() {
      Bundle.main.loadNibNamed("ImageView", owner: self, options: nil)
        addSubview(avatar)
        avatar.frame = self.bounds
        avatar.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
