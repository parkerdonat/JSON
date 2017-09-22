//
//  ImageView.swift
//  JSON
//
//  Created by Parker Donat on 9/20/17.
//  Copyright © 2017 Parker Donat. All rights reserved.
//

import UIKit

public class CloseView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var closeButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
      Bundle.main.loadNibNamed("CloseView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        let origImage = UIImage(named: "delete")
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        closeButton.setImage(tintedImage, for: .normal)
        closeButton.tintColor = .red
    }
}
