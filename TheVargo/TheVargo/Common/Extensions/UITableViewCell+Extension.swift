//
//  UITableViewCell+Extension.swift
//  WalletStone
//
//  Created by Andre on 12/06/2018.
//  Copyright © 2018 Andre. All rights reserved.
//

import UIKit

protocol ReusableView: class { }

extension ReusableView where Self: UIView {
    
    static var reuseIdentifier: String {
        return identifier
    }
}

extension UITableViewCell: ReusableView { }

protocol NibLoadableView: class { }

extension NibLoadableView where Self: UIView {
    
    static var nibName: String {
        return identifier
    }
}
