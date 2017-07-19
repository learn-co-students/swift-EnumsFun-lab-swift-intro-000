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
    
    init(cards: [Card]) {
        let ranks = [Rank.ace, Rank.eight, Rank.five, Rank.four, Rank.jack, Rank.king, Rank.nine, Rank.queen, Rank.seven, Rank.six, Rank.ten, Rank.three, Rank.two]
        let suits = [Suit.club, Suit.diamond, Suit.heart, Suit.spade]
        
        var deck = [Card]()
        
        for suit in suits {
            for rank in ranks {
                deck.append(Card(rank: rank, suit: suit))
            }
        }

        self.cards = deck.shuffled()
    }
    
    func split() -> ([Card], [Card]) {
        return cards.split()
    }
    
}


