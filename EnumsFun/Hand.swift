//
//  Hand.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Hand {
    
    var cards:[Card]
    
    var size:Int {
        return cards.count
    }
    
    init(cards:[Card]) {
        self.cards = cards
    }
    
    func flip() -> Card? {
        
        if cards.count != 0 {
            let tempCards = cards
            cards.remove(at: (cards.count - 1))
            return tempCards[tempCards.count - 1]
        }
        return nil
    }
    
    func give(card:Card) {
        cards.insert(card, at: 0)
    }
    
    func lose(card:Card) {
        
        for (i,cardType) in cards.enumerated() {
            if cardType.rank == card.rank && cardType.suit == card.suit {
                cards.remove(at: i)
            }
        }
    }
}
