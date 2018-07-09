//
//  VCardView.swift
//  TheVargo
//
//  Created by Andre Souza on 09/07/2018.
//  Copyright © 2018 AndreSamples. All rights reserved.
//

import UIKit

@IBDesignable
class VCardView: UIView {

    @IBInspectable var cornerRadius: CGFloat = 2 {
        didSet {
            updateViewsFromIB()
        }
    }
    
    @IBInspectable var shadowColor: UIColor? = UIColor.black {
        didSet {
            updateViewsFromIB()
        }
    }
    
    @IBInspectable var layerBackgroundColor: UIColor? = UIColor.clear {
        didSet {
            updateViewsFromIB()
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 0.0 {
        didSet {
            updateViewsFromIB()
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            updateViewsFromIB()
        }
    }
    
    @IBInspectable var borderColor: UIColor? = UIColor.white {
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

extension VCardView: BaseViewProtocol {
    
    func setupView() {
        layer.cornerRadius = cornerRadius
        layer.borderColor = borderColor?.cgColor
        layer.masksToBounds = false
        layer.borderWidth = borderWidth
        layer.backgroundColor = layerBackgroundColor?.cgColor
        //Shadow
        let shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = cornerRadius
        layer.shadowPath = shadowPath
        layer.shouldRasterize = true
    }
    
}
