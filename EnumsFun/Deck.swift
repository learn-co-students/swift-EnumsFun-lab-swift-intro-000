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
        for rank in Rank.ranks {                                //Rank.ranks is an Array
            for suit in Suit.suits {                            // Suit.suits is an Array
                let card = Card(rank: rank, suit: suit)         // creating the 52 cards
                cards.append(card)
            }
        }
        cards.shuffle()
    }
    
    func split() -> ([Card], [Card]) {
        return cards.split()
    }
}


