//
//  Feed.swift
//  TheVargo
//
//  Created by Andre on 10/07/2018.
//  Copyright © 2018 AndreSamples. All rights reserved.
//

import Foundation

struct Feed: Decodable {
    
    var page: Int
    var totalPages: Int
    var items: [FeedContent]
    
    enum CodingKeys: String, CodingKey {
        case page
        case totalPages
        case items
    }
    
    init() {
        self.page = 0
        self.totalPages = 1
        self.items = []
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.page = try container.decode(Int.self, forKey: .page)
        self.totalPages = try container.decode(Int.self, forKey: .totalPages)
        self.items = try container.decode([FeedContent].self, forKey: .items)
    }
    
}
