//
//  VUrl.swift
//  TheVargo
//
//  Created by Andre on 11/07/2018.
//  Copyright © 2018 AndreSamples. All rights reserved.
//

import Foundation

let SERVER_URL = "https://private-410d2-vargo.apiary-mock.com"

enum EndPoints {
    
    case feed(page: Int)
    case relatedVideos(page: Int)
    
    var complement: String {
        switch self {
        case .feed(let page):
            return "/feed/page/\(page)"
        case .relatedVideos(let page):
            return "/videos/related/\(page)"
        }
    }
    
}


final class VUrl {
    
    static func path(for endPoint: EndPoints) -> String {
        return "\(SERVER_URL)\(endPoint.complement)"
    }
    
}
