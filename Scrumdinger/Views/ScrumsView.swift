//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by MorinBeck on 4/14/24.
//

import SwiftUI


struct ScrumsView: View {
    @Binding var scrums: [DailyScrum]
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresentingNewScrumView = false
    let saveAction: ()->Void
    
    var body: some View {
        NavigationStack {
            List($scrums) { $scrum in
                NavigationLink(destination: DetailView(scrum: $scrum)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily Scrums")
            .toolbar {
                Button(action: {
                    isPresentingNewScrumView = true
                }) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")
            }
        }
        .sheet(isPresented: $isPresentingNewScrumView) {
            NewScrumSheet(scrums: $scrums, isPresentingNewScrumView: $isPresentingNewScrumView)
        }
        .onChange(of: scenePhase) { phase in
            if phase == .inactive { saveAction()
            }
        }
    }
    
    
    struct ScrumsView_Previews: PreviewProvider {
        static var previews: some View {
            // 상수 바인딩을 ScrumsView initializer에게 전달해준다
            ScrumsView(scrums: .constant(DailyScrum.sampleData)) {
                
            }
        }
    }
}
