//
//  FeedListInteractor.swift
//  TheVargo
//
//  Created by Andre Souza on 09/07/2018.
//  Copyright (c) 2018 AndreSamples. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation

final class FeedListInteractor {
    
    fileprivate let feedService = FeedService()
    
}

// MARK: - Extensions -

extension FeedListInteractor: FeedListInteractorInterface {
    
    func getFeeds(page: Int, completion: @escaping (RequestResultType<Feed>) -> Void) {
        feedService.get(page, completion)
    }
    
}
