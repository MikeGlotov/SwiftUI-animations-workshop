//

import SwiftUI


public extension HStack {
    static func zeroSpacing(@ViewBuilder content: () -> Content) -> HStack {
        HStack(spacing: .zero, content: content)
    }
}
