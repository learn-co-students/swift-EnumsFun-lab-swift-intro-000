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
        var tempCards: [Card] = []
        
            for suitInt in 1 ... 4 {
                var suit: String = ""
                switch suitInt {
                case 1:
                    suit = "♦️"
                case 2:
                    suit = "♥️"
                case 3:
                    suit = "♠️"
                default:
                    suit = "♣️"
                }
                for rank in 2 ... 14{
                    tempCards.append(Card(rank: Rank(rawValue: rank)!, suit: Suit(rawValue: suit)!))
                }
            
            }
        
            tempCards.shuffle()
            cards = tempCards
    }
    
    func split() -> ([Card] , [Card]) {
       return cards.split()
    }
    
    
  
}


