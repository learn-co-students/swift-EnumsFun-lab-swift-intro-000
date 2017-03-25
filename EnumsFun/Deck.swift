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
        cards = []
        for suit in ["♠️", "♣️", "♥️", "♦️"] {
            for rank in 2...14 {
                let newrank = Rank(rawValue: rank)!
                let newsuit = Suit(rawValue: suit)!
                let newCard = Card.init(rank: newrank, suit: newsuit)
                cards.append(newCard)
            }
        }
        cards.shuffle()
    }
    
    func split() -> ([Card],[Card]) {
        return cards.split()
    }
}


