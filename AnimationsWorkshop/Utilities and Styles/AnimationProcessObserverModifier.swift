//

import SwiftUI

/// An animatable modifier that is used for observing changes for a given animatable value.
struct AnimationProcessObserverModifier<Value: VectorArithmetic>: AnimatableModifier {
    /// While animating, SwiftUI changes the old input value to the new target value using this property.
    var animatableData: Value {
        didSet {
            notifyUpdate()
        }
    }

    /// The callback which is called when animatableData changes.
    private var notificationBlock: (Value) -> Void

    init(observedValue: Value, notificationBlock: @escaping (Value) -> Void) {
        self.notificationBlock = notificationBlock
        animatableData = observedValue
    }

    /// Notifies when animatableValue changes.
    private func notifyUpdate() {
        /// Dispatching is needed to take the next runloop for the completion callback.
        /// This prevents errors like "Modifying state during view update, this will cause undefined behavior."
        DispatchQueue.main.async {
            self.notificationBlock(animatableData)
        }
    }

    func body(content: Content) -> some View {
        /// We're not really modifying the view so we can directly return the original input value.
        return content
    }
}

extension View {
    /// Calls the completion handler whenever the given value changes during animation.
    /// - Parameters:
    ///   - value: The value to observe for animations.
    ///   - notificationBlock: The callback to call when animatable value changes.
    /// - Returns: A modified `View` instance with the observer attached.
    func onAnimationProgress<Value: VectorArithmetic>(
        for value: Value,
        notificationBlock: @escaping (Value) -> Void
    )
        -> ModifiedContent<Self, AnimationProcessObserverModifier<Value>> {
        return modifier(AnimationProcessObserverModifier(observedValue: value, notificationBlock: notificationBlock))
    }
}

