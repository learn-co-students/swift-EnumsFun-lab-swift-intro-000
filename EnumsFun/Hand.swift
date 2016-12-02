//
//  Hand.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Hand {
    var cards: [Card]
    var size: Int {
        return cards.count
    }
    
    init(cards: [Card]) {
        self.cards = cards
    }
    
    func flip() -> Card? {
        if cards.count > 0 {
            return cards.remove(at: 0)
        } else {
            return nil
        }
    }
    
    func give(card: Card) {
        cards.append(card)
    }
    
    func lose(card: Card) {
        cards.remove(at: 0)
    }
}
