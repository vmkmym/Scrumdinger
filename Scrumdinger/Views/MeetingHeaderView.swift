//
//  MeetingHeaderView.swift
//  Scrumdinger
//
//  Created by MorinBeck on 4/22/24.
//

import SwiftUI
    
struct MeetingHeaderView: View {
    let secondsElased: Int
    let secondsRemaining: Int
    
    private var totalSeconds: Int {
        secondsElased + secondsRemaining
    }
    
    private var progress: Double {
        guard totalSeconds > 0 else { return 1 }
        return Double(secondsElapsed) / Double(totalSeconds)
    }
    
    private var minutesRemaining: Int {
        secondsRemaining / 60
    }
    
    var body: some View {
        VStack {
            ProgressView(value: progress)
            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("\(secondsElapsed)", systemImage: "hourglass.bottomhalf.fill")

                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("\(secondsRemaining)", systemImage: "hourglass.tophalf.fill")
                }
            }
        }
        .accessibilityElement(children: /*@START_MENU_TOKEN@*/.ignore/*@END_MENU_TOKEN@*/)
        .accessibilityLabel("Time remaining")
        .accessibilityValue("\(minutesRemaining) minutes")
    }
}
    
#Preview {
    MeetingHeaderView(secondsElapsed: 60, secondsRemaining: 180)
        .previewLayout(.sizeThatFits)
}
