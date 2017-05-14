//
//  Player.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

//Next, open up Player.swift. This file contains a class called Player that represents one participant in the game of war.
//Add a property called name of type String to Player.
//Add a property called hand of type Hand to Player. (Note: For testing purposes, this property must be a variable.)
//Create an initializer that takes two parameters: name of type String and hand of type Hand. This initializer should set the equivalent properties.
//Create a function called hasCards() that returns a Bool indicating if the player has cards left in their hand or not.
//Create a function called flip() that returns a Card?. If the player has cards, it should return the top card of their hand; otherwise, it should return nil.
//Implement give(card:) and lose(card:) as described in Hand.swift, above. They should do the same thing.
//(Hint: flip(), give(card:), and lose(card:) will probably make use of the same methods defined on the Hand class.)

class Player {
    var name: String
    var hand: Hand
    
    init(name: String, hand: Hand) {
        self.name = name
        self.hand = hand
    }
    
    func hasCards() -> Bool {
        return hand.size > 0
    }
    
    func flip() -> Card? {
        return hand.flip()
    }
    func give(card: Card) {
        hand.give(card: card)
    }
    func lose(card: Card) {
        hand.lose(card: card)
    }
}

