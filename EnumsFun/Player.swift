//
//  Player.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Player {
    
    //Add a property called name of type String to Player.
    var name: String
    
    //Add a property called hand of type Hand to Player. (Note: For testing purposes, this property must be a variable.)
    var hand: Hand
    
    //Create an initializer that takes two parameters: name of type String and hand of type Hand. This initializer should set the equivalent properties.
    init (name:String, hand: Hand) {
        self.name = name
        self.hand = hand
    }
    
    //Create a function called hasCards() that returns a Bool indicating if the player has cards left in their hand or not.
    func hasCards() -> Bool {
        if !self.hand.cards.isEmpty {
            return true
        } else {
            return false
        }
    }
    
    //Create a function called flip() that returns a Card?. If the player has cards, it should return the top card of their hand; otherwise, it should return nil.
    func flip() -> Card? {
        if hasCards() {
             return self.hand.flip()
        } else  {
            return nil
        }
    }
    
    func giveCard(card:Card) {
        hand.giveCard(card: card)
    }
    
    func loseCard(card:Card) {
        hand.loseCard(card: card)
    }
    //Implement giveCard(_:) and loseCard(_:) as described in Hand.swift, above. They should do the same thing.
    //(Hint: flip(), giveCard(_:), and loseCard(_:) will probably make use of the same methods defined on the Hand class.)
    
}
