//

import SwiftUI

extension View {
    @inlinable func imageResizable(
        capInsets: EdgeInsets = EdgeInsets(),
        resizingMode: Image.ResizingMode = .stretch
    ) -> some View {
        environment(\.imageResizable, ImageResizable(capInsets: capInsets, resizingMode: resizingMode))
    }
}
