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
        let card = cards[0]
        guard !cards.isEmpty else {return nil}
        cards.removeLast()
        return card
    }
    
    func give(card: Card) {
        cards.append(card)
    }
    
    func lose(card: Card) {
        if let index = cards.index(of: card) {
            cards.remove(at: index)
        }
    }
    
}
