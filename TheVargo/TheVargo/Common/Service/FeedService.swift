//
//  FeedService.swift
//  TheVargo
//
//  Created by Andre Souza on 11/07/2018.
//  Copyright © 2018 AndreSamples. All rights reserved.
//

import Foundation
import Alamofire

typealias FeedCompletionBlock = (RequestResultType<Feed>) -> (Void)

class FeedService: NSObject {
    
    private let url: String = ""
    
    func getFeed(completion: @escaping FeedCompletionBlock) {
        let service = APIService(with: url)
        service.getData(completion)
    }

    
}
