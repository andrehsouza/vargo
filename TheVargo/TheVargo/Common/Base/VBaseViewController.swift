//
//  VBaseViewController.swift
//  TheVargo
//
//  Created by Andre Souza on 09/07/2018.
//  Copyright © 2018 AndreSamples. All rights reserved.
//

import UIKit

class VBaseViewController: UIViewController {
    
    private lazy var fenceView: VFenceView = {
       return VFenceView.fromNib()
    }()
    
}

//MARK: - Fence Functions -
extension VBaseViewController {
    
    private func verifyFenceView() {
        if(!fenceView.isDescendant(of: view)) {
            view.addSubview(fenceView)
            fenceView.bindFrameToSuperviewBounds()
            fenceView.isHidden = true
        }
    }
    
    func showErrorView(message: String, target: Any, action:Selector) {
        verifyFenceView()
        fenceView.showErrorView(message: message, target: target, action: action)
        view.bringSubview(toFront: fenceView)
        fenceView.isHidden = false
    }
    
    func showLoadingView(_ loading: Bool) {
        if loading {
            verifyFenceView()
            fenceView.showFenceLoadingView()
            view.bringSubview(toFront: fenceView)
            fenceView.isHidden = false
        } else {
            view.sendSubview(toBack: fenceView)
            fenceView.isHidden = true
        }
        
    }

}
