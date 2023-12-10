//
//  Person.swift
//  PrayForYou
//
//  Created by Christoph Wottawa on 10.12.23.
//

import Foundation
import SwiftData

@Model
class Person {
    var name: String
    var isPrayingFor: String?

    init(name: String) {
        self.name = name
    }
}
