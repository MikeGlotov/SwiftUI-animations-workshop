//

import SwiftUI

struct LoadingViewStart: View {
    @Environment(\.presentationMode) var presentationMode

    //MARK: Animations

    var body: some View {
        VStack.zeroSpacing {
            Spacer()

            ZStack(alignment: .center) {

                Circle()
                    .stroke(style: StrokeStyle(lineWidth: 4.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(.primary)
                    .frame(width: 80,
                           height: 80)
                    .rotation3DEffect(.degrees(0.0),
                                      axis: (x: 1.0, y: 1.0, z: 0.0),
                                      anchor: UnitPoint(x: 0.0, y: 0.5),
                                      anchorZ: 0.0,
                                      perspective: 0.0)

                Circle()
                    .stroke(style: StrokeStyle(lineWidth: 4.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(.primary)
                    .frame(width: 80,
                           height: 80)
                    .rotation3DEffect(.degrees(0.0),
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
        .opacity(1.0)
        .offset(x: 0.0, y: 0.0)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct LoadingViewStart_Previews: PreviewProvider {
    static var previews: some View {
        LoadingViewStart()
    }
}
