//

import SwiftUI

struct LoadingViewSmall: View {
    //Loading animation
    private var loadingAnimation: Animation = .linear.repeatForever(autoreverses: true)
    private var stopAnimation: Animation = .linear
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
            .animation(isLoading ? loadingAnimation : stopAnimation, value: isLoading)
            .onAppear {
                isLoading = true

                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    isLoading = false
                    print("stopped animation")
                }
            }
    }
}

struct LoadingViewSmall_Previews: PreviewProvider {
    static var previews: some View {
        LoadingViewSmall()
    }
}
