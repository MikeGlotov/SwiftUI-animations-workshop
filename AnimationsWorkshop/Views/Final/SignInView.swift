//

import SwiftUI

struct SignInView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var loginText: String = ""
    @State var passwordText: String = ""
    @State var privacyEmailsAccepted = false
    @State var privacyDataAccepted = false

    // Animation
    @State var isShowingInputFields = false
    @State var loginTextXOffset = 0.0
    @State var passwordTextXOffset = 0.0
    @State var loginShakes: Int = 0
    @State var passwordShakes: Int = 0

    @State var isShowingPrivacy = false

    var body: some View {
        VStack.zeroSpacing {
            headerView

            if isShowingInputFields {
                textFields
                    .transition(.move(edge: .leading).combined(with: .scale))
            }

            if isShowingPrivacy {
                privacyView
                    .transition(.asymmetric(insertion: .opacity, removal: .scale))
            }

            Spacer()

            doneButton
        }
        .background(Color.background)
        .animation(.default, value: isShowingPrivacy)
        .onAppear {
            withAnimation(.default.delay(0.5).speed(0.6)) {
                isShowingInputFields = true
            }
        }
    }


    private var doneButton: some View {
        Button("Войти") {
            withAnimation {
                if loginText.isEmpty {
                    loginShakes += 1
                }

                if passwordText.isEmpty {
                    passwordShakes += 1
                }
            }

            if !passwordText.isEmpty && !loginText.isEmpty {
                presentationMode.wrappedValue.dismiss()
            }
        }
        .buttonStyle(MainButtonStyle())
        .padding()
    }

    private var textFields: some View {
        VStack(spacing: 32.0) {
            TextField("Ваша почта",
                      text: $loginText,
                      prompt: nil)
                .modifier(Shake(animatableData: CGFloat(loginShakes)))
                .textFieldStyle(.roundedBorder)
                .onChange(of: loginText) { _ in
                    isShowingPrivacy = !loginText.isEmpty && !passwordText.isEmpty
                }

            SecureField("Пароль",
                        text: $passwordText,
                        prompt: nil)
                .modifier(Shake(animatableData: CGFloat(passwordShakes)))
                .textFieldStyle(.roundedBorder)
                .onChange(of: passwordText) { _ in
                    isShowingPrivacy = !loginText.isEmpty && !passwordText.isEmpty
                }
        }
        .padding()
    }

    private var headerView: some View {
        VStack.zeroSpacing {
            HStack.zeroSpacing {
                Text("Зарегистрируйтесь чтобы получить персональную подборку")
                    .foregroundColor(.primaryText)
                    .font(.title2)
                    .fontWeight(.semibold)

                Spacer()
            }
        }
        .padding()
    }

    private var privacyView: some View {
        VStack(spacing: 16) {
            HStack.zeroSpacing {
                Text("Я согласен получать почтовую рассылку")
                    .foregroundColor(.primaryText)

                Spacer()

                Toggle("", isOn: $privacyEmailsAccepted)
                    .toggleStyle(SwitchToggleStyle(tint: .primary))
            }

            HStack(spacing: 8.0) {
                Text("Я согласен передать данные об использовании приложения")
                    .foregroundColor(.primaryText)

                Spacer()

                Toggle("", isOn: $privacyDataAccepted)
                    .toggleStyle(SwitchToggleStyle(tint: .primary))
            }
            .buttonStyle(MainButtonStyle())
        }
        .padding()
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
