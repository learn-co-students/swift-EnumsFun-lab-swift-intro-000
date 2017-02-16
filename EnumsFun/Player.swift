//
//  Player.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Player {
    
    
    let name : String
    var hand : Hand
    
    init (name : String, hand : Hand) {
        self.hand = hand
        self.name = name
    }
    
    func hasCards() -> Bool {
        return hand.size != 0
    }
    
    func flip() -> Card? {
        return hand.flip()
    }
    
    func give(card : Card) {
        hand.cards.insert(card, at: 0)
    }
    
    func lose(card : Card) {
        hand.cards.remove(at: 0)
    }
    
    
    
 
}

