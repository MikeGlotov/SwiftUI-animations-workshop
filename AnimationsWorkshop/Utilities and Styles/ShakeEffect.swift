//

import SwiftUI

//https://www.objc.io/blog/2019/10/01/swiftui-shake-animation/
//https://developer.apple.com/documentation/swiftui/geometryeffect

struct Shake: GeometryEffect {
    var amount: CGFloat = 10
    var shakesPerUnit = 1
    var animatableData: CGFloat

    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX: amount * sin(animatableData * .pi * CGFloat(shakesPerUnit)),
                                              y: 0))
    }
}
