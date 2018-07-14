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
import AVKit

final class FeedDetailPresenter {

    // MARK: - Private properties -

    private unowned let _view: FeedDetailViewInterface
    private let _interactor: FeedDetailInteractorInterface
    private let _wireframe: FeedDetailWireframeInterface
    
    private var _feedContent: FeedContent?
    private var _feedRelatedVideos: [FeedContent] = []

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
            displayFeedContent(feedContent)
        } else {
            _view.enableNavigationBarButtons(false)
        }
    }
    
    func setFeedDetailFromSplitViewController(_ feedContent: FeedContent) {
        _feedContent = feedContent
        displayFeedContent(feedContent)
        if feedContent.isVideo {
            _view.showRelatedVideosContainerAnimating(true)
        }
    }
    
    func viewDidAppear(animated: Bool) {
        if let feedContent = _feedContent, feedContent.isVideo {
            _view.showRelatedVideosContainerAnimating(true)
        }
    }
    
    func numberOfItems() -> Int {
        return _feedRelatedVideos.count
    }
    
    func item(at indexPath: IndexPath) -> FeedItemDetailInterface? {
        return _feedRelatedVideos[indexPath.item]
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        _feedContent = _feedRelatedVideos[indexPath.item]
        _view.showfeedContent(_feedRelatedVideos[indexPath.item])
        clearRelatedVideos()
        loadRelatedVideos()
    }
    
    func didPressPlay() {
        guard let urlString = _feedContent?.url, let urlToOpen = URL(string: urlString) else {
            _wireframe.showErrorAlert(with: "Couldn't play the video.")
            return
        }
        let player = AVPlayer(url: urlToOpen)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        _wireframe.show(playerViewController, with: .present(complation: {
            playerViewController.player?.play()
        }), animated: true)
    }
    
    func didPressShare() {
        guard let feedContent = _feedContent else { return }
        var shareItems: [Any] = [feedContent.title ?? ""]
        if let urlString = feedContent.url, let urlToOpen = URL(string: urlString) {
            shareItems.append(urlToOpen)
        }
        let activityViewController = UIActivityViewController(activityItems: shareItems, applicationActivities: [])
        _wireframe.show(activityViewController, with: .present(complation: nil), animated: true)
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
    
    func loadRelatedVideos() {
        if let page = _feedContent?.relatedVideos {
            _view.showWaitingView(with: .loading)
            _interactor.getRelated(page:  page, completion: { [weak self] result in
                self?._handleFeedResult(result)
            })
        }
    }
    
}

// MARK: - Extensions -

extension FeedDetailPresenter {
    
    private func displayFeedContent(_ feedContent: FeedContent) {
        _view.enableNavigationBarButtons(true)
        _view.showfeedContent(feedContent)
        if feedContent.isVideo {
            _view.showWaitingView(with: .loading)
        } else {
            _view.hideRelatedVideosContainer()
        }
    }
    
    private func clearRelatedVideos() {
        _feedRelatedVideos = []
        _view.reloadData()
    }
    
    private func _handleFeedResult(_ result: RequestResultType<[FeedContent]>) {
        switch result {
        case .success(let relatedVideos):
            _feedRelatedVideos = relatedVideos
            _view.showWaitingView(with: .success)
            _view.reloadData()
            _view.scrollCollectionToFirstItem()
            break
        case .failure(let errorResponse):
            debugPrint("Error: \(errorResponse)")
            _view.showWaitingView(with: .error)
            break
        }
    }
    
}
