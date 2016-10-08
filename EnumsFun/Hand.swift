//
//  Hand.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Hand {
    
    //Add a property called cards of type [Card] to Hand.
    var cards:[Card]
    
    //Add a computed property called size that returns the current size of the hand.
    var size: Int { return cards.count }
    
    //Create an initializer that takes an array of Cards called cards as a parameter. This array should be assigned to the cards property.
    init (cards:[Card]) {
        self.cards = cards
    }
    
    //Create a method called flip(). This method should return an optiona Card (Card?). It should return the top card from the hand, or nil if the deck is empty. This card should also be removed from the hand.
    func flip() -> Card? {
        //if the deck is not empty
        if !cards.isEmpty {
            //this removes the very top card
            return cards.remove(at: 0)
        } else {
            return nil
        }
    }
    
    //Create a method called giveCard(_:). This method should take one parameter, card, of type Card, and add it to the bottom of the hand.
    func giveCard(toBottomOfHand card:Card) {
        cards.append(card)
    }
    
    //Create a method called loseCard(_:). This method should take one parameter, card, of type Card, and remove that card from the hand.
    func loseCard(fromHand card:Card) {
        cards.removeFirst()
    }
}
