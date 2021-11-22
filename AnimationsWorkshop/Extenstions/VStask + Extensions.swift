//

import SwiftUI

public extension VStack {
    static func zeroSpacing(@ViewBuilder content: () -> Content) -> VStack {
        VStack(spacing: .zero, content: content)
    }
}

public extension View {
    func eraseToAnyView() -> AnyView {
        return AnyView(self)
    }
}
