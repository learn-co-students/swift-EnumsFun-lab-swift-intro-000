//
//  Deck.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Deck {
    var cards : [Card]
    
    init() {
        // have 52 cards into the deck.
        self.cards = [Card]()
        
        for index in 2 ... 14 {
            if let rank = Rank(rawValue: index)
            {
                self.cards.append(Card(rank: rank, suit: Suit.Spades));
                self.cards.append(Card(rank: rank, suit: Suit.Diamonds));
                self.cards.append(Card(rank: rank, suit: Suit.Hearts));
                self.cards.append(Card(rank: rank, suit: Suit.Clubs));
            }
            
        }
        
        // Shuffle the deck.
        self.cards.shuffle()
    }
    
    func split() -> ([Card], [Card]) {
        return self.cards.split()
    }
}
