//
//  Player.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Player {
    
    var name:String
    var hand:Hand
    
    init(name:String, hand:Hand){
        self.name = name
        self.hand = hand
    }
    
    func hasCards()->Bool{
    return self.hand.cards.count > 0
    }
    
    func flip() -> Card? {
        if self.hasCards(){
           return self.hand.cards.first
        } else {
            return nil
        }
    }
    func give(card:Card){
        hand.give(card: card)
    }
    
    func lose(card:Card) {
        hand.lose(card: flip()!)
    }
    
}
