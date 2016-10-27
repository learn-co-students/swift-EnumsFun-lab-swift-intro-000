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
    var size:Int{
        return cards.count
    }
    
    init(cards:[Card]) {
        self.cards = cards
    }
    
    
    func flip()->Card?{
        
        if self.cards.count > 0 {
            return self.cards.remove(at: 0)
        }else {
            return nil
        }
        
    }
    
    func give(card:Card){
        
        self.cards.append(card)
        
    }
    
    func lose(card:Card){
        
        for (index,onecard) in self.cards.enumerated() {
            if onecard.rank.rawValue == card.rank.rawValue {
                self.cards.remove(at: index)
            }
            
        }
        
    }
    
}
