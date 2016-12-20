//
//  Deck.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Deck {
    var cards:[Card] = []
    
    var validSuits:[Suit] = [.Spades,.Hearts,.Clubs,.Diamonds]
    var rank:[Rank] = [.ace,.two,.three,.four,.five,.six,.seven,.eight,.nine,.ten,.jack,.queen,.king]
   
    
    
    init() {
        for(cardSuit) in validSuits {
            for(cardRank) in rank{
                let card = Card(rank: cardRank, suit: cardSuit)
                cards.append(card)
                
            }
        }
        cards = cards.shuffled()
        
    }
    
    func split()->([Card],[Card]){
    return cards.split()
    }
}
