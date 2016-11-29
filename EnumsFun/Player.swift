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
//        return hand.size > 0 ? true : false
        return hand.size > 0
    }
    
    func flip() -> Card? {
//        guard hand.size > 0 else { return nil }
//        return hand.cards.remove(at: 0)
        guard hasCards() else { return nil }
        return hand.flip()
    }
    
    func give(card: Card) {
//        hand.cards.append(card)
        hand.give(card: card)
    }
    
    func lose(card: Card) {
//        hand.cards.remove(at: 0)
        hand.lose(card: card)
    }
    
}
