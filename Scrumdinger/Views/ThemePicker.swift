//
//  ThemePicker.swift
//  Scrumdinger
//
//  Created by MorinBeck on 4/19/24.
//
// 상수 바인딩을 전달하여 미리 보기에서 테마 선택기를 초기화함. 상수(_:) 유형 메서드를 사용하여 하드코딩된 불변의 값에 대한 바인딩을 만들 수 있음. 상수 바인딩은 미리보기 또는 앱의 사용자 인터페이스를 프로토타이핑할 때 유용함

import SwiftUI


struct ThemePicker: View {
    @Binding var selection: Theme
    
    var body: some View {
        Picker("Theme", selection: $selection) {
            ForEach(Theme.allCases) { theme in
                ThemeView(theme: theme)
                    .tag(theme)
            }
        }
        .pickerStyle(.navigationLink)
    }
}


struct ThemePicker_Previews: PreviewProvider {
    static var previews: some View {
        ThemePicker(selection: .constant(.periwinkle))
    }
}
