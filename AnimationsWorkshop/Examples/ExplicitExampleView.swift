//

import SwiftUI

// Пример показывающий явные анимации

struct ExplicitExampleView: View {
    @State var buttonTapped = false

    var body: some View {
        VStack.zeroSpacing {
            Spacer()

            Rectangle()
                .foregroundColor(.blue)
                .frame(width: 100, height: 100)
                .opacity(buttonTapped ? 1.0 : 0.0)

            Spacer()

            Button("Tap") {
                withAnimation {
                    buttonTapped.toggle()
                }
            }
        }
    }
}

struct FirstExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ExplicitExampleView()
    }
}
