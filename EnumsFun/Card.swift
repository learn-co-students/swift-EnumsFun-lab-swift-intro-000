//
//  Card.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

enum Suit: String {
    
    static let suits :[Suit] =                                            //creating an array to with all the suits
        [.spades, .diamonds, .hearts, .clubs]
    
    case spades = "♠️", diamonds = "♣️", hearts = "♥️",  clubs = "♦️"

}

enum Rank: Int {
    
    static let ranks :[Rank] =                                              //creating an array to with all the ranks
        [.two, .three, .four, .five, .six, .seven, .eight, .nine, .ten, .jack, .queen, .king, .ace]
    
    case two = 2
    case three          //3
    case four           //4
    case five
    case six
    case seven
    case eight
    case nine
    case ten
    case jack
    case queen
    case king
    case ace            //14
    
    var stringValue: String {
        switch self {                                                           // self meaning : Rank => case .jack == Rank.jack
        case .jack:
            return "J"
        case .queen:
            return "Q"
        case .king:
            return "K"
        case .ace:
            return "A"
        default:
            return "\(rawValue)"
        }
    }
    
    
 
}

class Card {

    let suit : Suit
    let rank : Rank

    init(rank : Rank, suit : Suit) {
    self.rank = rank
    self.suit = suit
}
    
    var description: String {
        return rank.stringValue + suit.rawValue
    }
		
    
}
