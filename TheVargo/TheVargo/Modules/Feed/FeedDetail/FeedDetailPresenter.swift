//
//  FeedDetailPresenter.swift
//  TheVargo
//
//  Created by Andre Souza on 09/07/2018.
//  Copyright (c) 2018 AndreSamples. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class FeedDetailPresenter {

    // MARK: - Private properties -

    private unowned let _view: FeedDetailViewInterface
    private let _interactor: FeedDetailInteractorInterface
    private let _wireframe: FeedDetailWireframeInterface
    
    private let _feedContent: FeedContent?

    // MARK: - Lifecycle -

    init(wireframe: FeedDetailWireframeInterface,
         view: FeedDetailViewInterface,
         interactor: FeedDetailInteractorInterface,
         feedContent: FeedContent?) {
        _wireframe = wireframe
        _view = view
        _interactor = interactor
        _feedContent = feedContent
    }
}

// MARK: - Extensions -

extension FeedDetailPresenter: FeedDetailPresenterInterface {
    
    func viewDidLoad() {
        if let feedContent = _feedContent {
            _view.showfeedContent(feedContent)
        }
    }
    
    func didPressPlay() {
        //TODO play video
    }
    
    func didPressShare() {
        var shareItems: [Any] = [_feedContent?.title ?? ""]
        if let urlString = _feedContent?.url, let urlToOpen = URL(string: urlString) {
            shareItems.append(urlToOpen)
        }
        let activityViewController = UIActivityViewController(activityItems: shareItems, applicationActivities: [])
        _view.open(activityViewController)
    }
    
    func didPressBookmark() {
        _view.setBookmarked()
    }
    
    func didPressUrl() {
        guard let urlString = _feedContent?.url, let urlToOpen = URL(string: urlString) else { return }
        if UIApplication.shared.canOpenURL(urlToOpen) {
            UIApplication.shared.open(urlToOpen, options: [:], completionHandler: nil)
        }
    }
    
}
