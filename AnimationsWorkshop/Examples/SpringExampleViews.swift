//

import SwiftUI

struct SpringExampleViews: View {
    @State var buttonTapped = false
    @State var offsetY = 0.0

    var body: some View {
        VStack.zeroSpacing {
            Spacer()

            HStack.zeroSpacing {
                Spacer()

                Rectangle()
                    .foregroundColor(.blue)
                    .frame(width: 100, height: 100)
                    .offset(x: 0.0, y: offsetY)
                    .animation(.spring(response: 1.0,
                                       dampingFraction: 0.25,
                                       blendDuration: 0.25),
                               value: offsetY)

                Spacer()

                Rectangle()
                    .foregroundColor(.red)
                    .frame(width: 100, height: 100)
                    .offset(x: 0.0, y: offsetY)
                    .animation(.interpolatingSpring(mass: 0.2, // масса
                                                    stiffness: 0.7, //жесткость пружины
                                                    damping: 0.1, //ход пружины
                                                    initialVelocity: 10.0), //начальная скорость
                               value: offsetY)

                Spacer()

                Rectangle()
                    .foregroundColor(.yellow)
                    .frame(width: 100, height: 100)
                    .offset(x: 0.0, y: offsetY)
                    .animation(.interactiveSpring(),
                               value: offsetY)

                Spacer()
            }

            Spacer()

            Button("Tap") {
                buttonTapped.toggle()
                offsetY = buttonTapped ? 200.0 : 0.0
            }
        }
    }
}

struct SpringExampleViews_Previews: PreviewProvider {
    static var previews: some View {
        SpringExampleViews()
    }
}
