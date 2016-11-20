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
    
    init(cards:[Card]){
        self.cards = cards
    }
    
    var size:Int{
       return cards.count
    }
    
    func flip()->Card?{
        return cards.popLast()
    }
    
    func give(card:Card){
        cards.insert(card, at: 0)
    }
    
    func lose(card:Card){
        //_:Card? = nil
        var cnt = 0
        for c in cards{
            if (c.rank == card.rank) && (c.suit == card.suit){
                cards.remove(at: cnt)
                cnt += cnt
            }
        }
    }
}
