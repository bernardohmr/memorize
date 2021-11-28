//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Bernardo Rodrigues on 07/11/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static let emojis = ["✈️", "🚂", "🚀", "🚜", "🚲", "🛺", "🚘", "🛵", "🚚", "🚐", "🚒", "🚌", "🚓", "🏎", "🚁", "🛶", "⛵️", "🚤", "🛥", "🛳", "🛩", "🛸", "🎡", "🎠"]

    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 5) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
