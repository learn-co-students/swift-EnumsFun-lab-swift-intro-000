//
//  Hand.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Hand{
    
    var cards : [Card] = []
    var size : Int {
        return cards.count
    }
    
    init(cards: [Card]) {
        self.cards = cards
    }
    
    func flip() -> Card? {
        if cards.count > 0{
            let card = cards[0]
            cards.remove(at:0) // should also remove card from hand
            return card
        } else {
            return nil
        }
    }
    
    func give(card: Card){
        cards.append(card)
    }
    
    func lose(card: Card){
        
        let result1 = 0
        cards.remove(at: result1)
    }
}
