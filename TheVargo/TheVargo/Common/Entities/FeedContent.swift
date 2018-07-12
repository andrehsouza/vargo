//
//  FeedContent.swift
//  TheVargo
//
//  Created by Andre Souza on 12/07/2018.
//  Copyright © 2018 AndreSamples. All rights reserved.
//

import Foundation

enum FeedContent: Decodable {
    case article(Article)
    case video(Video)
}

extension FeedContent {
    
    enum CodingKeys: String, CodingKey {
        case article, video
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let article = try container.decodeIfPresent(Article.self, forKey: .article) {
            self = .article(article)
        } else {
            self = .video(try container.decode(Video.self, forKey: .video))
        }
    }
}


//MARK: - FeedItemInterface -

extension FeedContent: FeedItemInterface {
    
    var title: String? {
        switch self {
        case .article(let article):
            return article.title
        case .video(let video):
            return video.title
        }
    }
    
    var description: String? {
        switch self {
        case .article(let article):
            return article.description
        case .video(_):
            return ""
        }
    }
    
    var imageURL: String? {
        switch self {
        case .article(let article):
            return article.imageUrl
        case .video(let video):
            return video.thumbnail
        }
    }
    
    var isMarked: Bool {
        //TODO
        return false
    }
    
    
}
