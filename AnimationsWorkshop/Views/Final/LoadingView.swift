//

import SwiftUI

struct LoadingView: View {
    @Environment(\.presentationMode) var presentationMode

    //MARK: Animations
    @State var isLoaded = false // флаг который триггерит анимацию
    @State var isLoading = false // флаг который триггерит анимацию
    @State var rotationDegrees = 110.0

    private let animation = Animation.easeInOut.repeatForever(autoreverses: true).speed(0.8)

    var body: some View {
        VStack.zeroSpacing {
            Spacer()

            ZStack(alignment: .center) {

                Circle()
                    .stroke(style: StrokeStyle(lineWidth: 4.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(.primary)
                    .frame(width: 80,
                           height: 80)
                    .rotation3DEffect(.degrees(isLoading ? 0.0 : rotationDegrees),
                                      axis: (x: 1.0, y: 1.0, z: 0.0),
                                      anchor: UnitPoint(x: 0.0, y: 0.5),
                                      anchorZ: 0.0,
                                      perspective: 0.0)

                Circle()
                    .stroke(style: StrokeStyle(lineWidth: 4.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(.primary)
                    .frame(width: 80,
                           height: 80)
                    .rotation3DEffect(.degrees(isLoading ? rotationDegrees : 0.0),
                                      axis: (x: 1.0, y: 1.0, z: 0.0),
                                      anchor: UnitPoint(x: 0.0, y: 0.5),
                                      anchorZ: 0.0, perspective: 1.0)
                VStack(spacing: 8.0) {
                    Text("ButterFly")
                        .foregroundColor(.primaryText)
                        .font(.title2)
                        .fontWeight(.semibold)

                    Text("Самый новый поиск авиабилетов")
                        .foregroundColor(.secondaryText)
                        .font(.caption)
                        .fontWeight(.medium)
                }
                .offset(x: 0.0, y: 120)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            Spacer()
        }
        .background(Color.background)
        .opacity(isLoaded ? 0.0 : 1.0)
        .offset(x: 0.0, y: isLoaded ? 200.0 : 0.0)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            withAnimation(animation) {
                isLoading = true
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                withAnimation {
                    isLoaded = true
                }
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
