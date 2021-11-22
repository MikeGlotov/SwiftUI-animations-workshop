//

import SwiftUI
import Combine

struct OnboardingTabOne: View {
    @Namespace var nameSpace
    @State var isShowingCountryInfo = false
    @State var countries = Country.testData

    var body: some View {
        VStack.zeroSpacing {

            Spacer()

            if !isShowingCountryInfo {
                cardView
                    .frame(width: 320.0, height: 420)
                    .onTapGesture {
                        withAnimation(.easeInOut.speed(1.1)) {
                            isShowingCountryInfo = true
                        }
                    }
            } else {
                infoList
                    .background(roundedRectView.matchedGeometryEffect(id: "id", in: nameSpace))
                    .frame(width: 380.0, height: 500.0)
                    .onTapGesture {
                        withAnimation(.easeInOut.speed(1.1)) {
                            isShowingCountryInfo = false
                        }
                    }
                }

            Spacer()
        }
        .padding()
    }

    private var cardView: some View {
        VStack.zeroSpacing {
            Text("Нажмите, чтобы увидеть все предложения")
                .font(.title2)
                .foregroundColor(.primaryText)

            Spacer()

            Image("Astranout")
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 8))

            Spacer()
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 8).foregroundColor(Color.backgroundLighter).matchedGeometryEffect(id: "id", in: nameSpace))
    }
    
    private var infoList: some View {
        VStack.zeroSpacing {
            ScrollView {
                ForEach(countries) { country in
                    cellView(for: country)
                    .frame(height: 80)
                }

                closeButton {
                    withAnimation {
                        isShowingCountryInfo = false
                    }
                }
                .padding(.bottom, 16.0)
            }
        }
    }

    private var roundedRectView: some View {
        RoundedRectangle(cornerRadius: 8.0)
            .foregroundColor(.backgroundLightest)
            .onTapGesture {
                withAnimation(.easeInOut.speed(1.1)) {
                    isShowingCountryInfo = false
                }
            }
    }

    private func closeButton(handler: @escaping() -> ()) -> some View {
        HStack.zeroSpacing {
            Spacer()

            Button(action: {
                handler()
            }, label: {
                Text("Закрыть")
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
                    .frame(height: 40)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 8.0).foregroundColor(.white)
                    )
            })

            Spacer()
        }
        .padding(.bottom, 16.0)
    }

    private func cellView(for country: Country) -> some View {
        HStack(spacing: 16.0) {
            Text(country.flagEmoji)
                .matchedGeometryEffect(id: country.id.uuidString + "emoji",
                                       in: nameSpace)

            Text(country.name)
                .foregroundColor(.white)
                .fontWeight(.semibold)
                .matchedGeometryEffect(id: country.id.uuidString + "txt",
                                       in: nameSpace)

            Spacer()

            LoadingViewSmall()
        }
        .padding()
    }
}

struct OnboardingTabOne_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingTabOne()
    }
}
