//
//  FeedService.swift
//  TheVargo
//
//  Created by Andre Souza on 11/07/2018.
//  Copyright © 2018 AndreSamples. All rights reserved.
//

import Foundation
import Alamofire

class FeedService: NSObject, ServiceProtocol {
    
    typealias Entity = Feed
    
    func get(_ page: Int, _ completion: @escaping (RequestResultType<Feed>) -> Void) {
        let url = VUrl.path(for: .feed(page: page))
        let service = APIService(with: url)
        service.getData(completion)
    }
    
}
