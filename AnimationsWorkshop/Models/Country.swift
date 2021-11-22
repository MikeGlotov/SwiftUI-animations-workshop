//

import Foundation

struct Country: Identifiable {
    static let testData = [Country(name: "Италия", flagEmoji: "🇮🇹"),
                           Country(name: "Россия", flagEmoji: "🇷🇺"),
                           Country(name: "Испания", flagEmoji: "🇪🇸"),
                           Country(name: "Ирландия", flagEmoji: "🇮🇪"),
                           Country(name: "Турция", flagEmoji: "🇹🇷"),
                           Country(name: "Греция", flagEmoji: "🇬🇷"),
                           Country(name: "Украина", flagEmoji: "🇺🇦"),
                           Country(name: "Германия", flagEmoji: "🇩🇪"),
                           Country(name: "Япония", flagEmoji: "🇯🇵"),
                           Country(name: "Китай", flagEmoji: "🇨🇳"),
                           Country(name: "Канада", flagEmoji: "🇨🇦"),
                           Country(name: "Аргентина", flagEmoji: "🇦🇷")]
    let name: String
    let flagEmoji: String
    let id = UUID()
}
