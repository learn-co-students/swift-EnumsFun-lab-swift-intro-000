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
  
    init( ){
        var t_deck: [Card] = []
        for suit in Suit.suits{
            for rank in Rank.ranks{
                t_deck.append(Card(rank: rank, suit: suit))
            }
        }
        
        t_deck.shuffle()
        self.cards = t_deck
    }
    
    func split( ) -> ([Card], [Card]) {
        return self.cards.split()
    }
}


