//
//  UITableView+Extension.swift
//  WalletStone
//
//  Created by Andre on 12/06/2018.
//  Copyright © 2018 Andre. All rights reserved.
//

import UIKit

extension UITableView {
    
    func register<T: UITableViewCell>(_: T.Type) where T: NibLoadableView {
        let Nib = UINib(nibName: T.nibName, bundle: nil)
        register(Nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
    
}
