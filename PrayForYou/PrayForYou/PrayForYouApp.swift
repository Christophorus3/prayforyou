//
//  PrayForYouApp.swift
//  PrayForYou
//
//  Created by Christoph Wottawa on 02.12.23.
//

import SwiftUI
import SwiftData

@main
struct PrayForYouApp: App {
    var body: some Scene {
        WindowGroup {
            PersonsListView()
        }
        .modelContainer(for: Person.self)
    }
}
