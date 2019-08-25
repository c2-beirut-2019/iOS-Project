//
//  String.swift
//  Animal House
//
//  Created by Roy Geagea on 8/24/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import Foundation

extension String {
    
    func animalHouseDate() -> Date {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        return dateFormater.date(from: self)!
    }
}
