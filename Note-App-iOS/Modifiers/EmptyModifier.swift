//
//  EmptyModifier.swift
//  Note-App-iOS
//
//  Created by Dimas Aristyo Rahadian on 12/06/24.
//

import SwiftUI

struct EmptyModifier: ViewModifier {

    let isEmpty: Bool

    func body(content: Content) -> some View {
        Group {
            if isEmpty {
                EmptyView()
            } else {
                content
            }
        }
    }
}
