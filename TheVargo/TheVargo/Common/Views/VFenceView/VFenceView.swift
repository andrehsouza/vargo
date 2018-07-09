//
//  VFenceView.swift
//  TheVargo
//
//  Created by Andre on 11/06/2018.
//  Copyright © 2018 Andre. All rights reserved.
//

import UIKit

class VFenceView: UIView {

    @IBOutlet weak var loadingView: VCardView!
    @IBOutlet weak var errorView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var btRetry: VButton!
    @IBOutlet weak var messageLbl: UILabel!
    
    func showFenceLoadingView() {
        errorView.isHidden = true
        loadingView.isHidden = false
        activityIndicator.startAnimating()
    }
    
    func showErrorView(message: String, target: Any, action:Selector) {
        errorView.isHidden = false
        loadingView.isHidden = true
        btRetry.removeTarget(nil, action: nil, for: .allEvents)
        messageLbl.text = message
        btRetry.addTarget(target, action: action, for: .touchUpInside)
        activityIndicator.stopAnimating()
    }
    
    @IBAction func touchRetry(_ sender: Any) {
        showFenceLoadingView()
    }
    
}
