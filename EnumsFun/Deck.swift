//
//  Deck.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

//Add a property called cards of type [Card] to Deck.
//Create a new initializer than creates a deck of playing cards. This should be an array of 52 Card instances of the appropriate rank and suit. (Hint: You can use a couple of for loops to do this -- remember how to create Rank and Suit enums from raw values!) Assign this to the cards property. Make sure the deck is shuffled! (Hint: You can call shuffleInPlace() on an Array to shuffle the contents. This method was provided to you.)
//Add a method called split(). This method should split the set of the cards in half and return a two-element tuple consisting of each half of the deck (i.e., the return type is ([Card], [Card]). (Hint: An Array method called split() has been written for you in the Array.swift file.)
class Deck {
    var cards: [Card]
    
    init () {
        //this is initializing the cards array
        cards = []
        for suit in ["♠️", "♦️", "♥️", "♣️"] {
            for rank in 2...14 {
//                cards.append(Card(rank: Rank(rawValue: rank)!, suit: Suit(rawValue: suit)!))
                let suit = Suit(rawValue: suit)!
                let rank = Rank(rawValue: rank)!
                let card = Card(rank: rank, suit: suit)
                cards.append(card)
                 print(cards)
            }
        }
        //after I create the deck, shuffle it
        cards.shuffle()
    }
    
    func split() -> ([Card], [Card]) {
        let firstHalf = cards.split().0
        let secondHalf = cards.split().1
//        let splitDeck = cards.split()
//        let firstHalfDeck = splitDeck.0
//        let secondHalfDeck = splitDeck.1
        return (firstHalf, secondHalf)
    }
    
}
