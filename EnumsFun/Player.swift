//
//  Player.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Player {
    let name: String
    var hand: Hand
    
    init(name: String, hand: Hand){
        self.name = name
        self.hand = hand
    }
    
    func hasCards( ) -> Bool{
        if hand.cards.count > 0{
            return true
        }
        return false
    }
    
    func flip( ) -> Card?{
        if self.hand.cards.count > 0{
            return self.hand.flip()
        }
        return nil
    }
    
    func give(card: Card){
        self.hand.give(card: card)
    }
    
    func lose(card: Card){
        self.hand.lose(card: card)
    }
}

