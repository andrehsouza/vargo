//
//  VSplitViewController.swift
//  TheVargo
//
//  Created by Andre Souza on 09/07/2018.
//  Copyright © 2018 AndreSamples. All rights reserved.
//

import UIKit

class VSplitViewController: UISplitViewController  {

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        preferredDisplayMode = .allVisible
        delegate = self
    }

}

// MARK: - Split view

extension VSplitViewController: UISplitViewControllerDelegate {
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController:UIViewController, onto primaryViewController:UIViewController) -> Bool {
        return true
    }
    
}
