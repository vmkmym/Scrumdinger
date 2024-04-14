//
//  Theme.swift
//  Scrumdinger
//
//  Created by MorinBeck on 4/13/24.
//

import SwiftUI

enum Theme: String {
    case bubblegum
    case buttercup
    case indigo
    case lavender
    case magenta
    case navy
    case orange
    case oxblood
    case periwinkle
    case poppy
    case purple
    case seafoam
    case sky
    case tan
    case teal
    case yellow
    
    // self값에 따라 .black or .white를 반환하는 .accentColor 속성을 추가한다.
    // 강조 색상은 테마의 기본 색상에 대한 고대비 보완을 제공하여 뷰에 계속 액세스할 수 있도록 보장한다.
    var accentColor: Color {
            switch self {
            case .bubblegum, .buttercup, .lavender, .orange, .periwinkle, .poppy, .seafoam, .sky, .tan, .teal, .yellow: return .black
            case .indigo, .magenta, .navy, .oxblood, .purple: return .white
            }
        }
    // mainColor라는 Color 속성은 열거형의 rawValue를 사용하여 컬러를 생성한다.
    var mainColor: Color {
            Color(rawValue)
        }
    
    // 소문자로 정의된 enum case를 대문자로 표시
    var name: String {
        rawValue.capitalized
    }
}
