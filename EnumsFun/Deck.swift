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
        for suit in [Suit.spades, Suit.clubs, Suit.hearts, Suit.diamonds] {
            for rank in [Rank.two, Rank.three, Rank.four, Rank.five, Rank.six, Rank.seven, Rank.eight, Rank.nine, Rank.ten, Rank.jack, Rank.queen, Rank.king, Rank.ace] {
                let card = Card(rank: rank, suit: suit)
                cards.append(card)
            }
        }
        cards.shuffle()
    }
    
    func split () -> ([Card],[Card]) {
        
        let tuple = cards.split()
        
        return tuple
        
    }
}


