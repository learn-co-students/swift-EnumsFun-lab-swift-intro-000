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
    
    func hasCards()-> Bool {
        return !hand.cards.isEmpty
    }
    
    func flip() -> Card? {
        if hasCards() {
            var topCard = hand.cards[0]
            var newCards = hand.cards.dropFirst()
            return topCard
        } else {
            return nil
        }
    }
    
    func give(card: Card) {
        hand.cards.append(card)
    }
    
    func lose()-> [Card]{
        hand.cards.dropFirst()
        return hand.cards
    }
    
 
}

