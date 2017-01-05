//
//  Deck.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Deck {
    
    var cards: [Card]
    
    init () {
        
        var deck : [Card] = []
        
        for s in Suit {
            for r in Rank.RawValue {
                deck.append(s , r)
            }
        }
        
        cards = deck

        
    }
}
