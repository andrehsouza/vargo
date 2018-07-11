//
//  Article.swift
//  TheVargo
//
//  Created by Andre Souza on 09/07/2018.
//  Copyright © 2018 AndreSamples. All rights reserved.
//

import Foundation

struct Article: Decodable, FeedProtocol {
    var content: FeedContent {
        return .article
    }
    var date: String?
    var title: String?
    var website: String?
    var authors: String?
    var text: String?
    var imageUrl: String?
    
    private enum CodingKeys: String, CodingKey {
        case date
        case title
        case website
        case authors
        case text
        case imageUrl
    }
    
}
