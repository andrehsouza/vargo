//
//  Date+Extensions.swift
//  TheVargo
//
//  Created by Andre Souza on 13/07/2018.
//  Copyright © 2018 AndreSamples. All rights reserved.
//

import Foundation


extension Date {
    
    init?(dateString: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        guard let date = dateFormatter.date(from: dateString) else {
            fatalError("ERROR: Date conversion failed due to mismatched format.")
            return nil
        }
        self = date
    }

    func stringFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        return dateFormatter.string(from: self)
    }
}
