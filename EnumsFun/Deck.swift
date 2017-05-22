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
        for suit in Suit.allSuits {
            for rank in Rank.allRanks {
                cards.append(Card(rank: rank, suit: suit))
            }
        }
        cards.shuffle()
    }
    
    func split() -> ([Card], [Card]) {
        return cards.split()
    }
}


