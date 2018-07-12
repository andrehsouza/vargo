//
//  Video.swift
//  TheVargo
//
//  Created by Andre on 10/07/2018.
//  Copyright © 2018 AndreSamples. All rights reserved.
//

import Foundation

struct Video: Decodable {
    
    var title: String?
    var thumbnail: String?
    var videoUrl: String
    var relatedVideos: Int?
    
}
