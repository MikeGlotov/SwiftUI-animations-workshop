//

import SwiftUI

struct OnboardingViewStart: View {

    var body: some View {
        VStack.zeroSpacing {
            header
                .frame(height: 80)
                .opacity(1.0)

            TabView {
                OnboardingTabOneStart()

                OnboardingTabTwoStart()
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))

            Spacer()

            Button("Продолжить") {

            }
            .buttonStyle(MainButtonStyle())
            .padding()
        }
        .background(Color.background)
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

struct OnboardingViewStart_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingViewStart()
    }
}
