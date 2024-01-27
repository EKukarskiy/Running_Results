//
//  Running_ResultsApp.swift
//  Running Results
//
//  Created by Evgeniy K on 21.01.2024.
//

import SwiftUI
import SwiftData

@main
struct Running_ResultsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Running.self)
    }
}
