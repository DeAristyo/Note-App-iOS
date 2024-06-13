//
//  ViewExtensions.swift
//  Note-App-iOS
//
//  Created by Dimas Aristyo Rahadian on 12/06/24.
//

import SwiftUI

extension View {
    /// Whether the view should be empty.
    /// - Parameter bool: Set to `true` to hide the view (return EmptyView instead). Set to `false` to show the view.
    func isEmpty(_ bool: Bool) -> some View {
        modifier(EmptyModifier(isEmpty: bool))
    }
    
    /// Change color of the placeholder and set the placeholder text
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}

