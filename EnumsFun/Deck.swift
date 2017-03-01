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
    
    init(){
        for suit in ["♣️","♠️","♥️","♦️"] {
            for rank in 2...14 {
                self.cards.append(Card(rank: Rank(rawValue: rank)!, suit: Suit(rawValue: suit)!))
            }
        }
        cards.shuffle()
    }
    
    func split() -> ([Card],[Card]) {
        return self.cards.split()
    }
  
}


