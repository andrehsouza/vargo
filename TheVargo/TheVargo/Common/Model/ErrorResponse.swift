//
//  ErrorResponse.swift
//  TheVargo
//
//  Created by Andre Souza on 11/07/2018.
//  Copyright © 2018 AndreSamples. All rights reserved.
//

import Foundation

struct ErrorResponse {
    
    var title: String = "Attention"
    var message: String = "An unexpected error has occurred, please try again in a moment."
    var hideButton: Bool = false
    var buttonText: String = "Retry"
    
}

extension ErrorResponse {
    
    init(_ message: String) {
        self.message = message
    }
    
}

extension ErrorResponse {
    
    init(_ resultType: ResponseType) {
        self.title = resultType.title
        self.message = resultType.message
    }
    
}
