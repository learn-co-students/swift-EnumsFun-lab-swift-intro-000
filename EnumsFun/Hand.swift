//
//  Hand.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Hand {
    
    var cards:[Card] = []
    var size: Int{
        return cards.count
    }
    
    init(cards:[Card]) {
        self.cards = cards
    }
    
    func flip()-> Card?{
        if (!cards.isEmpty) {
            return cards.removeFirst()
        }
        return nil
    }
    
    func give(card: Card){
        self.cards.insert(card, at: (cards.count))
    }
    func lose(card: Card){
        for (index,loseCard) in cards.enumerated(){
            if(card === loseCard ){
                cards.remove(at: index)
            }
        }
    }
}
