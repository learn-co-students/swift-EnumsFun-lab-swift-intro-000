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
        return cards.count
    }
    
    init (cards : [Card]) {
        self.cards = cards
    }
    
    func flip() -> Card? {
        guard !cards.isEmpty else {return nil}     // it is a fancy ""if statment"
        return cards.removeLast()
    }
    
    func give(card : Card) {
        cards.insert(card, at: 0)
    }
    
    func lose(card : Card) {
        cards.remove(at: 0)
    }
    
}
