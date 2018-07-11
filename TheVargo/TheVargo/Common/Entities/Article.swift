//
//  Article.swift
//  TheVargo
//
//  Created by Andre Souza on 09/07/2018.
//  Copyright © 2018 AndreSamples. All rights reserved.
//

import Foundation

struct Article: Decodable {

    var date: String?
    var title: String?
    var url: String?
    var author: String?
    var description: String?
    var imageUrl: String?

}
