//
//  Running.swift
//  Running Results
//
//  Created by Evgeniy K on 21.01.2024.
//

import Foundation
import SwiftData

@Model
class Running {
    var distance: String
    var result: String
    var date: Date
    var summary: String
    
    init(distance: String = "", result: String = "", date: Date = .now, summary: String = "") {
        self.distance = distance
        self.result = result
        self.date = date
        self.summary = summary
    }
}
