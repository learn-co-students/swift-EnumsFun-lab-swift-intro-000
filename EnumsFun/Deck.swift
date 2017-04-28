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
        for r in Rank.allValues {
            for s in Suit.allValues {
                cards.append(Card(rank: Rank(rawValue: r)!, suit: Suit(rawValue: s)!))
            }
        }
        cards.shuffle()
    }
    func split() -> ([Card], [Card]) {
        let decks = cards.split()
        return decks
    }
  
}

