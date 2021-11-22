//

import SwiftUI

// Пример показывающий неявные анимации

struct ImplicitExampleView: View {
    @State var buttonTapped = false
    @State var opacity = 0.0

    var body: some View {
        VStack.zeroSpacing {
            Spacer()

            Rectangle()
                .foregroundColor(.blue)
                .frame(width: 100, height: 100)
                .opacity(opacity)
                .animation(.easeOut, value: opacity)

            Spacer()

            Button("Tap") {
                buttonTapped.toggle()
                opacity = buttonTapped ? 1.0 : 0.0
            }
        }
    }
}

struct ImplicitExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ImplicitExampleView()
    }
}
