//
//  Player.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Player {
    let name: String
    var hand: Hand
    
    init(name: String, hand: Hand) {
        self.name = name
        self.hand = hand
    }
    func hasCards() -> Bool {
        guard !hand.cards.isEmpty else {return false}
        return true
    }
    
    func flip() -> Card? {
        return hand.flip()
    }
    
    func give(card: Card) {
        return hand.give(card: card)
    }
    
    func lose(card: Card) {
        return hand.lose(card: card)
    }
    
    //Create a function called hasCards() that returns a Bool indicating if the player has cards left in their hand or not.
 
}

