//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by MorinBeck on 4/12/24.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @StateObject private var store = ScrumStore()
    
    
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $store.scrums)
                .task {
                    do {
                        try await store.load()
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
        }
    }
