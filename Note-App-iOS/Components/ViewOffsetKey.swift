//
//  ViewOffsetKey.swift
//  Note-App-iOS
//
//  Created by Dimas Aristyo Rahadian on 03/06/24.
//

import SwiftUI

struct ViewOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}
