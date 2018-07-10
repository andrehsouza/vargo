//
//  BaseWireframe.swift
//  TheVargo
//
//  Created by Andre Souza on 06/07/2018.
//  Copyright © 2018 AndreSamples. All rights reserved.
//

import Foundation
import UIKit

enum Transition {
    case root
    case push
    case present(fromViewController: UIViewController)
}

protocol WireframeInterface: class {
    func popFromNavigationController(animated: Bool)
    func dismiss(animated: Bool)
    func show(_ wireframe: BaseWireframe, with transition: Transition, animated: Bool)
}

class BaseWireframe {
    
    fileprivate unowned var _viewController: UIViewController
    
    init(viewController: UIViewController) {
        _viewController = viewController
    }
    
}

extension BaseWireframe {
    
    var viewController: UIViewController {
        return _viewController
    }
    
    var navigationController: UINavigationController? {
        return viewController.navigationController
    }
    
}

extension BaseWireframe: WireframeInterface {
    
    func popFromNavigationController(animated: Bool) {
        let _ = navigationController?.popViewController(animated: animated)
    }
    
    func dismiss(animated: Bool) {
        navigationController?.dismiss(animated: animated)
    }
    
    func show(_ wireframe: BaseWireframe, with transition: Transition, animated: Bool) {
        switch transition {
        case .push:
            navigationController?.pushWireframe(wireframe, animated: animated)
        case .present(let fromViewController):
            let navigationController = VNavigationController()
            navigationController.setRootWireframe(wireframe)
            fromViewController.present(navigationController, animated: animated, completion: nil)
        case .root:
            navigationController?.setRootWireframe(wireframe, animated: animated)
        }
    }

}
