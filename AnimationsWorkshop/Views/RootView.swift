//

import SwiftUI

struct RootView: View {
    @State var isLoderPresented = true
    @State var isSignInPresented = false
    @State var isOnboardingPresented = false

    var body: some View {
        EmptyView()
            .fullScreenCover(isPresented: $isLoderPresented,
                             onDismiss: { isSignInPresented = true }) {
                LoadingView()
            }
            .fullScreenCover(isPresented: $isSignInPresented,
                             onDismiss: { isOnboardingPresented = true }) {
                SignInView()
            }
            .fullScreenCover(isPresented: $isOnboardingPresented) {
                OnBoardingView()
            }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
