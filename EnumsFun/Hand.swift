//
//  Hand.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Hand {
    var cards: [Card] = []
    var size: Int{
        return cards.count
    }

    init(cards: [Card]){
        self.cards = cards
    }
    
    func flip( ) -> Card?{
        if self.cards.count > 0{
            return self.cards.popLast()
        }
        return nil
    }
    
    func give(card: Card){
        self.cards.insert(card, at: 0)
    }
    
    func lose(card: Card){
        if let index = self.cards.index(of: card){
            self.cards.remove(at: index)
        }
    }
}
