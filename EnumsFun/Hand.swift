//
//  Hand.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Hand {
    var cards : [Card]
    
    var size : Int {
        get {
            return cards.count
        }
    }
    
    init(cards : [Card]) {
        self.cards = cards
    }
    
    func flip() -> Card? {
        if let card = cards.first {
            cards.remove(at : 0)
            return card
        }
        else {
            return nil
        }
    }
    
    func give(card : Card) {
        self.cards.append(card);
    }
    
    func lose(card : Card) {
        for (index, curCard) in self.cards.enumerated() {
            if (card.rank == curCard.rank && card.suit == curCard.suit) {
                cards.remove(at: index)
                break;
            }
        }
    }
}
