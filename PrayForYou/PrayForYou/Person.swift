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
    var isPrayingFor: Person?

    init(name: String) {
        self.name = name
    }
}
