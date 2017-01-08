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
        
        get {
            return cards.count
            
        }
        
    }
    
    init(cards: [Card]) {
        
        self.cards = cards
        
    }
    
    func flip () -> Card? {
        
        guard size > 0 else {return nil}
        let flipcard = cards.first
        cards.remove(at: 0)
        return flipcard
    
}

    func give(card: Card) {

cards.append(card)
}

    func lose(card: Card) {

        cards.remove(at: 0)

}

}
