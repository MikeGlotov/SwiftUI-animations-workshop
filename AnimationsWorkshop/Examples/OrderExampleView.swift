//

import SwiftUI

// Пример, показывающий важность правильного порядка модификаторов

struct OrderExampleView: View {
    @State var buttonTapped = false
    @State var opacity = 0.0

    var body: some View {
        VStack.zeroSpacing {
            Spacer()

            Rectangle()
                .foregroundColor(.blue)
                .frame(width: 100, height: 100)
                .animation(.easeOut, value: opacity)
                .opacity(opacity)

            Spacer()

            Rectangle()
                .foregroundColor(.red)
                .frame(width: 100, height: 100)
                .opacity(opacity)
                .animation(.easeOut.speed(0.5), value: opacity)

            Spacer()

            Button("Tap") {
                buttonTapped.toggle()
                opacity = buttonTapped ? 1.0 : 0.0
            }
        }
    }
}

struct OrderExampleView_Previews: PreviewProvider {
    static var previews: some View {
        OrderExampleView()
    }
}
