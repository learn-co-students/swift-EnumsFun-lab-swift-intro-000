//
//  Hand.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Hand {
    
    var cards : [Card]
    var size: Int {
        return cards.count
    }
    
    init(cards: [Card]) {
        
        self.cards = cards
    }
    
    
    func flip() -> Card? {
        
        if cards.isEmpty{
            return nil
        } else {
            
            var x = cards[0]
            cards.remove(at: 0)
            
            return x
        }
        
    }
    
    func give(card: Card) {
        
        cards.append(card)
        
    }
    
    func lose(card: Card) {
        
        for (index, value) in cards.enumerated(){
            
            if value.description == card.description{
                
                cards.remove(at: index)
                
            }
        }
        
    }
    
    
    
}

