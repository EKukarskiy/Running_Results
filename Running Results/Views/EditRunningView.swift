//
//  EditRunningView.swift
//  Running Results
//
//  Created by Evgeniy K on 22.01.2024.
//

import SwiftUI
import SwiftData

struct EditRunningView: View {
    @Bindable var running: Running
    
    var body: some View {
        Form {
            Section("Distance & result") {
                TextField("Distance", text: $running.distance)
                TextField("Result", text: $running.result)
            }
            
            Section("Date & Summary") {
                DatePicker("Select date", selection: $running.date)
                TextField("Make a note", text: $running.summary)
            }
        }
        .navigationTitle("Edit Result")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Running.self, configurations: config)
        let example = Running(distance: "200m", result: "22:55")
        return EditRunningView(running: example)
            .modelContainer(container)
    } catch {
        fatalError("Unable to create model container")
    }
}
