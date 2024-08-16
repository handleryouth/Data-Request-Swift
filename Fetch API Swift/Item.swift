//
//  Item.swift
//  Fetch API Swift
//
//  Created by Tony Gultom on 16/08/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
