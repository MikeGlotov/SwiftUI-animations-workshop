//

import SwiftUI

public extension EnvironmentValues {
    var imageResizable: ImageResizable? {
        get {
            return self[ImageResizableKey.self]
        }
        set {
            self[ImageResizableKey.self] = newValue
        }
    }
}

struct ImageResizableKey: EnvironmentKey {
    static let defaultValue: ImageResizable? = nil
}

public struct ImageResizable {
    public let capInsets: EdgeInsets
    public let resizingMode: Image.ResizingMode

    public init(
        capInsets: EdgeInsets = EdgeInsets(),
        resizingMode: Image.ResizingMode = .stretch
    ) {
        self.capInsets = capInsets
        self.resizingMode = resizingMode
    }
}

