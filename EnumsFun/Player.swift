//
//  Player.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Player {
    //initializers
    init(name: String, hand: Hand) {
        self.name = name
        self.hand = hand
    }
    //stored properties, name of type String, hand of type Hand
    var name: String
    var hand: Hand
    
    //methods
    func hasCards() -> Bool {
        return hand.size > 0
    }
    
    func flip()->Card? {
        if self.hasCards() {//call would be player.flip-->self becomes player
            return hand.flip()
        }
        return nil
    }
    
    func giveCard(card: Card) {
        hand.give(card: card)
    }
    
    func loseCard(card: Card) {
        hand.lose(card: card)
    }
 
    
}

