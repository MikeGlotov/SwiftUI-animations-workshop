//

import SwiftUI

struct OnBoardingView: View {
    @State var headerOpacity = CGFloat.zero
    @State var isPagerShown = false

    var body: some View {
        VStack.zeroSpacing {
            header
                .frame(height: 80)
                .opacity(headerOpacity)

            if isPagerShown {
                TabView {
                    OnboardingTabOne()

                    OnboardingTabTwo()
                }
                .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .always))
            }


            Spacer()

            Button("Продолжить") {

            }
            .buttonStyle(MainButtonStyle())
            .padding()
        }
        .background(Color.background)
        .onAppear {
            withAnimation(.default.delay(2.0)) {
                headerOpacity = 1.0
            }
        }
        .onAnimationCompleted(for: headerOpacity) {
            withAnimation {
                isPagerShown = true
            }
        }
    }

    private var header: some View {
        VStack(spacing: 8.0) {
            Text("ButterFly")
                .foregroundColor(.primaryText)
                .font(.title)
                .fontWeight(.bold)

            Text("Ознакомтесь с нашими преимуществами. Вам понравится!")
                .foregroundColor(.secondaryText)
                .font(.caption)
                .fontWeight(.medium)
        }
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
