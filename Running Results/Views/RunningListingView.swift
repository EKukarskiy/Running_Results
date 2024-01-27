//
//  RunningListingView.swift
//  Running Results
//
//  Created by Evgeniy K on 25.01.2024.
//

import SwiftUI
import SwiftData

struct RunningListingView: View {
    //MARK: create modelContext var call its methods
    @Environment(\.modelContext) var modelContext
    
    //MARK: reads data form data base and diplays in this view
    @Query(sort: [SortDescriptor(\Running.distance, order: .reverse), SortDescriptor(\Running.result)]) var runnings: [Running]
    
    var body: some View {
        List {
            ForEach(runnings) { running in
                NavigationLink(value: running) {
                    VStack(alignment: .leading, spacing: 8) {
                        
                        Text(running.distance)
                            .font(.system(size: 20, design: .rounded).bold())
                        
                        HStack {
                            Text("RESULT:")
                                .opacity(0.7)
                            
                            Text(running.result)
                        }
                        .font(.callout.bold())
                    }
                    .frame(maxWidth: .infinity, alignment: .leading )
                }
            }
            .onDelete(perform: deleteRunning)
        }
    }
    
    init(sort: SortDescriptor<Running>) {
        _runnings = Query(sort: [sort])
    }
    
    //MARK: "Delete" function
    func deleteRunning(_ indexSet: IndexSet) {
        for index in indexSet {
            let running = runnings[index]
            modelContext.delete(running)
        }
    }
}

#Preview {
    RunningListingView(sort: SortDescriptor(\Running.distance))
}
