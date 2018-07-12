//
//  FeedListInterfaces.swift
//  TheVargo
//
//  Created by Andre Souza on 09/07/2018.
//  Copyright (c) 2018 AndreSamples. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

enum FeedListNavigationOption {
    case detail(FeedContent)
}

protocol FeedListWireframeInterface: WireframeInterface {
    func navigate(to option: FeedListNavigationOption)
}

protocol FeedListViewInterface: ViewInterface {
    func reloadData()
    func showLoading(_ loading: Bool)
    func showError(error: ErrorInterface, target: Any, action:Selector)
}

protocol FeedListPresenterInterface: PresenterInterface {
    func numberOfSections() -> Int
    func numberOrItems(in section: Int) -> Int
    func item(at indexPath: IndexPath) -> FeedItemInterface?
    func didSelectItem(at indexPath: IndexPath)
}

protocol FeedListInteractorInterface: InteractorInterface {
    func getFeeds(page: Int, completion: @escaping (RequestResultType<Feed>) -> Void)
}

protocol FeedItemInterface {
    var title: String? { get }
    var description: String? { get }
    var imageURL: String? { get }
    var isMarked: Bool { get }
    var isVideo: Bool { get }
}
