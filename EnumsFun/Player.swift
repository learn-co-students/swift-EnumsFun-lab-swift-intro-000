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
        return !self.hand.cards.isEmpty
    }
    func flip() -> Card? {
        if !self.hand.cards.isEmpty {
            return self.hand.cards[0]
        }
        return nil
    }
    func give(card: Card) {
        hand.give(card: card)
    }
    func lose(card: Card) {
        hand.lose(card: card)
    }
 
}

