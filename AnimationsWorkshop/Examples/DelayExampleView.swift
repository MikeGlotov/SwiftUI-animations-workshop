//

import SwiftUI

struct DelayExampleView: View {
    @State var buttonTapped = false
    @State var opacity = 0.0

    var body: some View {
        VStack.zeroSpacing {
            Spacer()

            Rectangle()
                .foregroundColor(.blue)
                .frame(width: 100, height: 100)
                .opacity(opacity)
                .animation(.default.delay(0.5), value: opacity)

            Spacer()

            Rectangle()
                .foregroundColor(.blue)
                .frame(width: 100, height: 100)
                .opacity(opacity)
                .animation(.default, value: opacity)


            Button("Tap") {
                buttonTapped.toggle()
                opacity = buttonTapped == true ? 1.0 : 0.0
            }
        }
    }
}

struct DelayExampleView_Previews: PreviewProvider {
    static var previews: some View {
        DelayExampleView()
    }
}
