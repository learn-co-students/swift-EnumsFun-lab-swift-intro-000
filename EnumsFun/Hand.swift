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
    
    init(cards: [Card]) {
        self.cards = cards
    }
    
    func flip() -> Card? {
        guard size > 0 else { return nil }
        return cards.remove(at: 0)
    }
    // guard cuts down on nested statements and keeping things in proper scope, along with where for correct match. Size of hand to reference at and actually compare with, otherwise returning nil, perhaps there's another way
    
    
}
