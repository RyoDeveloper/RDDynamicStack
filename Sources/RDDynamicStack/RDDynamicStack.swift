//
//  RDDynamicStack.swift
//  RDDynamicStack
//
//  https://github.com/RyoDeveloper/RDDynamicStack
//  Copyright © 2024 RyoDeveloper. All rights reserved.
//

import SwiftUI

public struct RDDynamicStack<Content: View>: View {
    private let content: () -> Content
    private let layout: AnyLayout

    public init(
        axis: Axis, spacing: CGFloat? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.content = content
        self.layout =
            axis == .horizontal
            ? AnyLayout(HStackLayout(spacing: spacing))
            : AnyLayout(VStackLayout(spacing: spacing))
    }

    public var body: some View {
        layout {
            content()
        }
    }
}

#Preview {
    RDDynamicStack(axis: .vertical) {
        Text("View1")
        Text("View2")
    }
}
