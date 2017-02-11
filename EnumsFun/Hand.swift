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
    var size: Int {
        return cards.count
    }
    
    init(cards:[Card]){
        self.cards = cards
    }
    
    func flip() -> Card? {
        guard !cards.isEmpty else {return nil}
        return cards.removeLast()
    }
    
    func give(card:Card) {
        cards.insert(card, at: 0)
    
    }

    func lose(card:Card) {
        guard let index = cards.index(of: card) else {return}
        cards.remove(at: index)
        
    }
}
    //Next, open up Hand.swift. This file contains a class called Hand that represents a single player's hand.
    //Add a property called cards of type [Card] to Hand.
   // Add a computed property called size that returns the current size of the hand.
    //Create an initializer that takes an array of Cards called cards as a parameter. This array should be assigned to the cards property.
    //Create a method called flip(). This method should return an optional Card (Card?). It should return the top card from the hand, or nil if the deck is empty. This card should also be removed from the hand.
    //Create a method called give(card:). This method should take one parameter, card, of type Card, and add it to the bottom of the hand.
    //Create a method called lose(card:). This method should take one parameter, card, of type Card, and remove that card from the hand.


