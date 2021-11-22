//

import SwiftUI

struct MainButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
      HStack {
        Spacer()

        configuration
              .label
              .font(.body.weight(.semibold))
              .foregroundColor(.primaryText)

        Spacer()
      }
      .padding()
      .background(Color.primary.cornerRadius(8))
    }
}
