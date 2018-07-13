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
    
    func showFenceError(error: ErrorInterface, target: Any, action: Selector) {
        verifyFenceView()
        fenceView.showErrorView(error: error, target: target, action: action)
        view.bringSubview(toFront: fenceView)
        fenceView.isHidden = false
    }
    
    func showFenceLoading() {
        verifyFenceView()
        fenceView.showFenceLoadingView()
        view.bringSubview(toFront: fenceView)
        fenceView.isHidden = false
    }
    
    func hideFenceView() {
        view.sendSubview(toBack: fenceView)
        fenceView.isHidden = true
    }

}
