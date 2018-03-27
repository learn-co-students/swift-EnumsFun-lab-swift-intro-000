//
//  Player.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Player {
    
    var name:String
    var hand:Hand
    
    init(name:String,hand:Hand) {
        
        self.name = name
        self.hand = hand
    }
    
    init() {
        let cards:[Card] = []
        self.name = ""
        self.hand = Hand(cards: cards)
    }
    
    func hasCards() -> Bool {
        
        if hand.size != 0 {
            return true
        }
        return false
    }
    
    func flip() -> Card? {
        
        if hasCards() {
            let tempCards = hand.cards
            hand.cards.remove(at: (hand.cards.count - 1))
            return tempCards[tempCards.count - 1]
        }
        return nil
    }
 
    func give(card:Card) {
        hand.cards.insert(card, at: 0)
    }
    
    func lose(card:Card) {
        
        for (i,cardType) in hand.cards.enumerated() {
            if cardType.rank == card.rank && cardType.suit == card.suit {
                hand.cards.remove(at: i)
            }
        }
    }
    
}

