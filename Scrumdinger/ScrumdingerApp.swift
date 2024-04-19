//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by MorinBeck on 4/12/24.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData
    
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
    }
}
