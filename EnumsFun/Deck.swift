//
//  Deck.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Deck {
    
    var cards:[Card]
    
    init() {
        cards = []
        for suit in ["♠️","♦️","♥️","♣️"] {
            
            for rank in 2...14 {
                
                var newCard = Card(suit:Suit(rawValue:suit)!,rank:Rank(rawValue:rank)!)
                cards.append(newCard)
                
                
            }
            
        }
        
        self.cards = self.cards.shuffled()
        
    }
    
    
    func split()->([Card],[Card]){
        
        return self.cards.split()
        
    }
    
    
    
}
