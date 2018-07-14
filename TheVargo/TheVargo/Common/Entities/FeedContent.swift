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

extension FeedContent: FeedListItemInterface {
    
    var isVideo: Bool {
        switch self {
        case .article(_):
            return false
        case .video(_):
            return true
        }
    }
    
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
            return "Watch it now!"
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

//MARK: - FeedItemDetailInterface -

extension FeedContent: FeedItemDetailInterface {
    
    var screenTitle: String {
        return isVideo ? "Video" : "Article"
    }
    
    var authorTitle: String? {
        switch self {
        case .article(_):
            return "Author"
        case .video(_):
            return nil
        }
    }
    
    var author: String? {
        switch self {
        case .article(let article):
            return article.author
        case .video(_):
            return nil
        }
    }
    
    var urlTitle: String? {
        switch self {
        case .article(_):
            return "Font"
        case .video(_):
            return nil
        }
    }
    
    var urlDescription: String? {
        switch self {
        case .article(let article):
            if let urlString = article.url, let url = URL(string: urlString) {
                return url.host
            } else {
                return article.url
            }
        case .video(_):
            return nil
        }
    }
    
    var url: String? {
        switch self {
        case .article(let article):
            return article.url
        case .video(let video):
            return video.videoUrl
        }
    }
    
    var date: String? {
        switch self {
        case .article(let article):
            if let dateString = article.date, let mDate = Date.init(dateString: dateString) {
                return "Published on \(mDate.stringFormat())"
            } else {
                return nil
            }
        case .video(_):
            return nil
        }
        
    }
    
    var relatedVideos: Int? {
        switch self {
        case .article(_):
            return nil
        case .video(let video):
            return video.relatedVideos
        }
    }
    
}
