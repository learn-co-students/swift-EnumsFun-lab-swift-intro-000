//
//  Hand.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Hand {
    init(cards: [Card]) {//initializer that takes an array of [Card] called cards, then assign this to the cards property
        self.cards = cards
    }
    
    var cards: [Card] //property cards of type [Card]
    var size: Int {//computed property size, returning current size of hand (in cards)
        get {
            return cards.count
        }
    }
    
    func flip()-> Card? {
        if cards.count != 0 {
            return cards.remove(at: 0)//cards.remove(at: index) gives the card it took
        }
        return nil
    }
    
    func give(card: Card) {
        cards.append(card)
    }
    
    func lose(card: Card) {
        cards.remove(at: 0)
    }
    
}
