//
//  Hand.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Hand {
    var cards: [Card]
    
    var size: Int {
        return cards.count
    }
    
    init(cards: [Card]){
        self.cards = cards
    }
    
    func flip() -> Card? {
        var card: Card?
        
        if cards.isEmpty {
            return nil
        } else {
        card = cards.remove(at: 0)
        return card
        }
    }
    
    func give(card: Card) {
        cards.append(card)
    }
    
    func lose(card: Card) {
        var counter = 0
        for cardToLose in cards {
            if card.description == cardToLose.description {
                cards.remove(at: counter)
            }
            counter += 1
        }
    }

    
}
