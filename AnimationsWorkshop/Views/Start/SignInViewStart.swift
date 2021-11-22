//

import SwiftUI

struct SignInViewStart: View {
    @Environment(\.presentationMode) var presentationMode
    @State var loginText: String = ""
    @State var passwordText: String = ""
    @State var privacyEmailsAccepted = false
    @State var privacyDataAccepted = false

    @State var isShowingPrivacy = false

    var body: some View {
        VStack.zeroSpacing {
            headerView

            textFields

            privacyView

            Spacer()

            doneButton
        }
        .background(Color.background)
    }


    private var doneButton: some View {
        Button("Войти") {
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
                .textFieldStyle(.roundedBorder)
                .onChange(of: loginText) { _ in
                    isShowingPrivacy = !loginText.isEmpty && !passwordText.isEmpty
                }

            SecureField("Пароль",
                        text: $passwordText,
                        prompt: nil)
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

struct SignInViewStart_Previews: PreviewProvider {
    static var previews: some View {
        SignInViewStart()
    }
}
