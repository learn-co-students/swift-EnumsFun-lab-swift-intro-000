//
//  Card.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

enum Suit : String {
    case Spades = "♠️", Diamonds = "♦️", Hearts = "♥️", Clubs = "♣️"
}

enum Rank : Int {
    case two = 2, three, four, five, six, seven, eight, nine, ten, jack, queen, king, ace
    
    //Add a String property to Rank called stringValue. This should return a string representing the value of the card: the numbered value for numbered cards, or "J", "Q", "K", or "A" for face cards. (Recall that the raw values for jack, queen, king, and ace are 11, 12, 13, and 14, respectively.)
    var stringValue: String {
        switch self {
        case .jack :
            return "J"
        case .queen :
            return "Q"
        case .king :
            return "K"
        case .ace :
            return "A"
        default:
            return "\(rawValue)"
        }
    }
}

class Card {
    
    //Add a property called suit of type Suit to the Card class.
    let suit: Suit
    //Add a property called rank of type Rank to the Card class.
    let rank: Rank
    //Add a computed property called description of type String to Card. It should return a string representing the suit and rank of the card, in the format "<rank><suit>".
    var description: String {
        //this gets the strings we assigned to the face cards and the emoji suits for each card.
        return "\(rank.stringValue)\(suit.rawValue)"
    }
    
    //Create an initializer for Card that accepts both a rank and a suit and sets the appropriate properties. These parameters should be called rank and suit.
    init (rank: Rank, suit: Suit) {
        self.rank = rank
        self.suit = suit
    }
}
