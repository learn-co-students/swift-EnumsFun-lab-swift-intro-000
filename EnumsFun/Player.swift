//
//  Player.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Player {
    var hand : Hand
    var name : String
    
    init(name : String, hand : Hand) {
        self.name = name;
        self.hand = hand;
    }
    
    func hasCards() -> Bool {
        return !self.hand.cards.isEmpty
    }
    
    func flip() -> Card? {
        return self.hand.flip()
    }
    
    func give(card : Card) {
        self.hand.give(card : card)
    }
    
    func lose(card : Card) {
        self.hand.lose(card : card)
    }
    
}
