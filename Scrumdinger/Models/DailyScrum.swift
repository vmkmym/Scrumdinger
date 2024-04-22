//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by MorinBeck on 4/13/24.
//

import Foundation
    
// 프로토콜 준수 선언
struct DailyScrum: Identifiable {
    let id: UUID
    var title: String
    var attendees: [Attendee]
    var lengthInMinutes: Int
    // 이중 정밀도 표현: 스크럼 길이를 조정할 슬라이더
    // 계산된 속성을 사용하면 스크럼의 길이를 double값으로 검색하는 getter와 슬라이더가 변경될 때 해당 정수값을 업데이트하는 setter를 제공할 수 있음
    var lengthInMinutesAsDouble: Double {
        // 스크럼 회의 기간을 이중 값으로 반환하는 getter 제공
        // 값을 반환하는 Swift 함수의 경우 return본문이 단일 표현식인 경우 키워드 생략 가능
        get {
            Double(lengthInMinutes)
        }
        set {
            lengthInMinutes = Int(newValue)
        }
    }
    var theme: Theme
    var history: [History] = []
    
    // 기본값을 할당하는 초기화 프로그램 추가 -> 매개변수의 기본값을 정의하면 초기화 프로그램이나 함수를 호출할 때 해당 매개변수를 생략할 수 있음
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
            self.id = id
            self.title = title
            self.attendees = attendees.map { Attendee(name: $0) }
            self.lengthInMinutes = lengthInMinutes
            self.theme = theme
        }
}

extension DailyScrum {
    struct Attendee: Identifiable {
        let id: UUID
        var name: String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
    
    static var emptyScrum: DailyScrum {
            DailyScrum(title: "", attendees: [], lengthInMinutes: 5, theme: .sky)
        }
}

extension DailyScrum {
    static let sampleData: [DailyScrum] =
    [
        DailyScrum(title: "Design",
                   attendees: ["Cathy", "Daisy", "Simon", "Jonathan"],
                   lengthInMinutes: 10,
                   theme: .yellow),
        DailyScrum(title: "App Dev",
                   attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"],
                   lengthInMinutes: 5,
                   theme: .orange),
        DailyScrum(title: "Web Dev",
                   attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"],
                   lengthInMinutes: 5,
                   theme: .poppy)
    ]
}
