//
//  Feed.swift
//  TheVargo
//
//  Created by Andre on 10/07/2018.
//  Copyright © 2018 AndreSamples. All rights reserved.
//

import Foundation

enum FeedContent: String, Decodable {
    case article = "article"
    case video = "video"
}

protocol FeedProtocol: Decodable {
    var content: FeedContent { get }
}

struct Feed: Decodable {
    var page: Int
    var totalResults: Int
    var items: [FeedProtocol]
    
    enum FeedKey: CodingKey {
        case items
    }
    
    enum CodingKeys: String, CodingKey {
        case page
        case totalResults
        case items
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let page: Int = try container.decode(Int.self, forKey: .page)
        let totalResults: Int = try container.decode(Int.self, forKey: .totalResults)
        let items: [FeedProtocol] = try container.decode(FeedProtocol.self, forKey: .items)
        
    }
    
}
