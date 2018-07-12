//
//  VImageView.swift
//  TheVargo
//
//  Created by Andre Souza on 12/07/2018.
//  Copyright © 2018 AndreSamples. All rights reserved.
//

import UIKit

@IBDesignable
class VImageView: UIImageView {

    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            updateViewsFromIB()
        }
    }
    
    @IBInspectable var isRenderingMode: Bool = false {
        didSet{
            setupView()
        }
    }
    
    override public func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        updateViewsFromIB()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

}

extension VImageView: BaseViewProtocol {
    
    func setupView() {
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
        let rederingMode = isRenderingMode ? UIImageRenderingMode.alwaysTemplate : UIImageRenderingMode.alwaysOriginal
        image = self.image?.withRenderingMode(rederingMode)
    }
        
}

