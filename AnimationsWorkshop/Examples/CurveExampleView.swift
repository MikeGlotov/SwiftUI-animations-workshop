//

import SwiftUI

struct CurveExampleView: View {
    @State var buttonTapped = false
    @State var offsetA = 0.0
    @State var offsetB = 0.0

    var body: some View {
        VStack.zeroSpacing {
            Spacer()

            Rectangle()
                .foregroundColor(.blue)
                .frame(width: 100, height: 100)
                .offset(x: offsetA, y: 0.0)
                //задаем свою огибающую, имитирующую пружину
                .animation(.timingCurve(0.0, 0.0, 0.0, 1.5),
                           value: offsetA)

            Spacer()

            Rectangle()
                .foregroundColor(.red)
                .frame(width: 100, height: 100)
                .offset(x: offsetA, y: 0.0)
                .animation(.easeInOut,
                           value: offsetA)

            Spacer()

            Button("Tap") {
                buttonTapped.toggle()
                offsetA = buttonTapped ? 200.0 : 0.0
                offsetB = buttonTapped ? 200.0 : 0.0
            }
        }
    }
}

struct CurveExampleView_Previews: PreviewProvider {
    static var previews: some View {
        CurveExampleView()
    }
}
