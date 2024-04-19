//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by MorinBeck on 4/14/24.
//

import SwiftUI


struct ScrumsView: View {
    @Binding var scrums: [DailyScrum]
    
    var body: some View {
        NavigationStack {
            // loop's closure의 각각의 iteration에 binding을 전달
            List($scrums) { $scrum in
                NavigationLink(destination: DetailView(scrum: $scrum)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily Scrums")
            .toolbar {
                Button(action: {}) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")
            }
        }
    }
}


struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        // 상수 바인딩을 ScrumsView initializer에게 전달해준다
        ScrumsView(scrums: .constant(DailyScrum.sampleData))
    }
}
