//
//  Deck.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Deck {
    var cards: [Card]
    
    init() {
        self.cards = []
        for suit in ["♠️", "♣️", "♥️", "♦️"] {
            for rank in 2...14 {
                self.cards.append(Card(suit: Suit(rawValue: suit)!, rank: Rank(rawValue: rank)!))
            }
            self.cards.shuffle()
        }
    }
    
    func split() -> ([Card], [Card]) {
        return cards.split()
    }
    
}
