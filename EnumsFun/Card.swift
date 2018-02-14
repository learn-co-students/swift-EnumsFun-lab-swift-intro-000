//
//  Card.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

enum Suit: String {
case clubs, hearts, diamonds, spades
    var stringValue: String {
    switch self {
    case .clubs:
        return "Clubs"
    case .hearts:
        return "Hearts"
    case .diamonds:
        return "Diamonds"
    case .spades:
        return "Spades"
    }
}
}


enum Rank: Int {
    case two = 2, three, four, five, six, seven, eight, nine, ten, jack, queen, king, ace
    
    /*
     Add a String property to Rank called stringValue. This should return a string representing the value of the card: the numbered value for numbered cards, or "J", "Q", "K", or "A" for face cards.
 */
    var stringValue: String {//string property
        switch self {
        case .ace:
            return "A"
        case .king:
            return "K"
        case .queen:
            return "Q"
        case . jack:
            return "J"
        default:
            return "\(rawValue)"
            
        }
    }
}//end Rank

class Card { //need an initializer
    init(suit: Suit, rank:Rank){
        self.suit = suit
        self.rank = rank
    }
    
    let suit:  Suit //property called suit of type Suit
    let rank: Rank //property called rank of type Rank
    
    var description: String { //computed property called description of type String
        get {
            return "\(rank.stringValue)\(suit.rawValue)"
        }
    }
    

    
}
