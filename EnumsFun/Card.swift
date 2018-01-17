//
//  Card.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

enum Suit: String {
case Spades = "♠️", Diamonds = "♦️", Hearts = "♥️", Clubs = "♣️"
}

enum Rank: Int {
    case jack,queen,king,ace,one,two,three,four,five,six,seven,eight,nine,ten
    var stringValue:String{
        switch self {
        case .jack:
            return "J"
        case .queen:
            return "Q"
        case .ace:
            return "A"
        case .king:
            return "K"
        default:
            return "\(rawValue)"
        }
    }
 
}

class Card {
    var suit:Suit
    var rank:Rank
    init(_ rank:Rank,_ suit:Suit) {
        self.suit = suit
        self.rank = rank
    }
}
