//
//  Deck.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Deck {
    var cards: [Card] = []
    
    init() {
        for suit in ["♠️", "♣️", "♥️", "♦️"] {
            for rank in 2...14 {
                let suit = Suit(rawValue: suit)!
                let rank = Rank(rawValue: rank)!
                let card = Card(rank: rank, suit: suit)
                self.cards.append(card)
            }
        }
        cards.shuffle()
    }
    
    func split() -> ([Card], [Card]) {
        return cards.split()
    }
}


