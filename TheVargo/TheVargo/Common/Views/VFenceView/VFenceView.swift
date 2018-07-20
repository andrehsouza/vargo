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
    
    @IBAction func touchRetry(_ sender: Any) {
        showFenceLoadingView()
    }
    
}

extension VFenceView {
    
    func showFenceLoadingView() {
        errorView.isHidden = true
        loadingView.isHidden = false
        activityIndicator.startAnimating()
    }
    
    func showErrorView(error: ErrorInterface, target: Any, action:Selector) {
        loadingView.isHidden = true
        errorView.isHidden = false
        messageLbl.text = error.message
        btRetry.removeTarget(nil, action: nil, for: .allEvents)
        btRetry.addTarget(target, action: action, for: .touchUpInside)
        btRetry.setTitle(error.buttonText, for: .normal)
        activityIndicator.stopAnimating()
    }
    
}
