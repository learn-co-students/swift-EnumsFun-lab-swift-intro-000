//
//  Hand.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Hand {
    var cards: [Card] = []
    var size: Int {
        return cards.count
    }
    init(cards: [Card]) {
        self.cards = cards
    }
    func flip() -> Card? {
        if !cards.isEmpty {
            let thisCard = cards[0]
            cards.remove(at: 0)
            return thisCard
        }
        return nil
    }
    func give(card: Card) {
        cards.append(card)
    }
    func lose(card: Card) {
        var index = 0
        for thisCard in self.cards {
            if thisCard.description == card.description {
                self.cards.remove(at: index)
            }
            index += 1
        }
    }

    
}
