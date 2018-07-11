//
//  Video.swift
//  TheVargo
//
//  Created by Andre on 10/07/2018.
//  Copyright © 2018 AndreSamples. All rights reserved.
//

import Foundation

struct Video: Decodable, FeedProtocol {
    var content: FeedContent {
        return .video
    }
    var thumbnail: String?
    var videoUrl: String
    var relatedVideo: [Video]?
    
    private enum CodingKeys: String, CodingKey {
        case thumbnail
        case videoUrl
        case relatedVideo
    }
    
}
