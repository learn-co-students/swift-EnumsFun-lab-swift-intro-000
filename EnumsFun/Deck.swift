//
//  Deck.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Deck {
    var cards:[Card] = []
    
    init() {
        for rank in Rank.ranks {
            for suit in Suit.suits {
                let card = Card(suit: suit , rank: rank)
                cards.append(card)
            }
        }
        cards.shuffle()
    }

    func split() -> ([Card], [Card]) {
        return cards.split()
    }
}

//Next, open up Deck.swift. You'll find a class in this file called Deck that represents a deck of cards.
//Add a property called cards of type [Card] to Deck.
//Create a new initializer than creates a deck of playing cards. This should be an array of 52 Card instances of the appropriate rank and suit. (Hint: You can use a couple of for loops to do this -- remember how to create Rank and Suit enums from raw values!) Assign this to the cards property. Make sure the deck is shuffled! (Hint: You can call shuffle() on an Array to shuffle the contents. This method was provided to you.)
//Add a method called split(). This method should split the set of the cards in half and return a two-element tuple consisting of each half of the deck (i.e., the return type is ([Card], [Card]). (Hint: An Array method called split() has been written for you in the Array.swift file.)

