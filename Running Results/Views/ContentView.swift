//
//  ContentView.swift
//  Running Results
//
//  Created by Evgeniy K on 21.01.2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    //MARK: create modelContext var call its methods
    @Environment(\.modelContext) var modelContext
    
    @State private var path = [Running]()
    @State private var sortOrder = SortDescriptor(\Running.distance)
    
    var body: some View {
        NavigationStack(path: $path) {
            RunningListingView(sort: sortOrder)
                .navigationTitle("Results")
                .navigationDestination(for: Running.self, destination: EditRunningView.init)
                .toolbar {
                    Button("Add Running", systemImage: "plus.circle", action: addRunning)
                    
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort", selection: $sortOrder) {
                            Text("Distance")
                                .tag(SortDescriptor(\Running.distance))
                            
                            Text("Result")
                                .tag(SortDescriptor(\Running.result))
                            
                            Text("Date")
                                .tag(SortDescriptor(\Running.date))
                        }
                    }
                    .pickerStyle(.inline)
                }
        }
        .accentColor(Color(.label))
    }
    
    func addRunning() {
        let runnig = Running()
        modelContext.insert(runnig)
        path = [runnig]
    }
}

#Preview {
    ContentView()
}
