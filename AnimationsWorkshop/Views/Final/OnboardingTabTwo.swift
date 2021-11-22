//

import SwiftUI



struct OnboardingTabTwo: View {

    //Matched Geometry animation
    @Namespace var nameSpace
    @State var isShowingCountryInfo = false
    //Loading animation
    @State var loadingAnimation = Animation.easeOut.repeatForever(autoreverses: true).speed(0.2)

    //List properties
    @State var countries = Country.testData
    @State var selectedCountry: Country?

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
                    .background(roundedRectView.matchedGeometryEffect(id: "id",
                                                                      in: nameSpace))
                    .frame(width: 380.0, height: 500.0)
                    .onTapGesture {
                        withAnimation(.easeInOut.speed(1.1)) {
                            isShowingCountryInfo = false
                        }
                    }
                }

            Spacer()
        }
    }

    private var cardView: some View {
        VStack.zeroSpacing {
            Text("Нажмите, чтобы страны, куда вы можете улететь уже сейчас!")
                .font(.title2)
                .foregroundColor(.primaryText)

            Spacer()

            Image("Airport")
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
                    }
                    .padding()
                    .frame(height: 80)
                    .onTapGesture {
                        withAnimation {
                            selectedCountry = country
                        }
                    }
                }

                closeButton {
                    withAnimation {
                        isShowingCountryInfo = false
                    }
                }
                .padding(.bottom, 16.0)
            }
        }
        .blur(radius: selectedCountry != nil ? 3 : 0)
        .disabled(selectedCountry != nil)
        .overlay(detailView)
    }

    private var roundedRectView: some View {
        RoundedRectangle(cornerRadius: 8.0)
            .foregroundColor(Color.backgroundLighter)
            .onTapGesture {
                withAnimation(.easeInOut.speed(1.1)) {
                    isShowingCountryInfo = false
                }
            }
    }

    private var detailView: some View {
        Group {
            if let country = selectedCountry {
                VStack.zeroSpacing {
                    Text(country.flagEmoji)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .matchedGeometryEffect(id: country.id.uuidString + "emoji",
                                               in: nameSpace)

                    Text(country.name)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .matchedGeometryEffect(id: country.id.uuidString + "txt",
                                               in: nameSpace)

                    Spacer()

                    closeButton {
                        withAnimation {
                            selectedCountry = nil
                        }
                    }
                }
                .background(RoundedRectangle(cornerRadius: 8).foregroundColor(.backgroundLightest))
            } else {
                EmptyView()
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
}

struct OnboardingTabTwo_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingTabTwo()
    }
}

