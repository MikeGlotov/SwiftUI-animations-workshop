//

import SwiftUI

struct LoadingViewSmallStart: View {
    //Loading animation
    private var loadingAnimation: Animation = .linear.repeatForever(autoreverses: true)
    @State var circleTrimValueStart = 0.0
    @State var circleTrimValueEnd = 0.2
    @State var circleRotationAngles = 0.0
    @State var isLoading = false

    var body: some View {
        Circle()
            .trim(from: isLoading ? 0.0 : 0.2, to: isLoading ? 0.2 : 1.0)
            .stroke(style: StrokeStyle(lineWidth: 4.0, lineCap: .round, lineJoin: .round))
            .foregroundColor(.white)
            .frame(width: 20, height: 20)
            .rotationEffect(.degrees(isLoading ? 360 : 0))
            .animation(loadingAnimation, value: isLoading)
            .onAppear {
                isLoading = true
            }
    }
}

struct LoadingViewSmallStart_Previews: PreviewProvider {
    static var previews: some View {
        LoadingViewSmallStart()
    }
}
