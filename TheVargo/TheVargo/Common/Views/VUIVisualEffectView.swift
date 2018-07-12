//
//  VUIVisualEffectView.swift
//  TheVargo
//
//  Created by Andre Souza on 12/07/2018.
//  Copyright © 2018 AndreSamples. All rights reserved.
//

import UIKit

@IBDesignable
class VUIVisualEffectView: UIVisualEffectView {

    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            updateViewsFromIB()
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

extension VUIVisualEffectView: BaseViewProtocol {
    
    func setupView() {
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
        layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
}
