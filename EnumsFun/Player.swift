//
//  Player.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Player {
    var name: String
    var hand: Hand
    
    init(name: String, hand: Hand) {
        self.name = name
        self.hand = hand
    }

    func hasCards() -> Bool {
        return hand.isEmpty()
    }
    
    func flip() -> Card? {
        if hand.isEmpty() {
            return nil
        }
        else {
            return hand.cards.removeFirst()
        }
    }
    
    func give(card: Card) {
        hand.cards.append(card)
    }
    
    func lose(acard: Card) {
        hand.cards.remove(at: 0)
    }
    
}

