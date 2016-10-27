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
    case two = 2, three, four, five, six, seven, eight, nine, ten, jack, queen, king, ace
    
    var stringValue:String{
        
        switch self.rawValue {
        case 11:
            return "J"
        case 12:
            return "Q"
        case 13:
            return "K"
        case 14:
            return "A"
        default:
            return String(describing: self.rawValue)
        }
        
    }
}

class Card {
    
    
    var suit:Suit
    var rank:Rank
    var description:String {
        return "\(rank.stringValue)\(suit.rawValue)"
    }
    
    init(suit:Suit,rank:Rank) {
        self.suit = suit
        self.rank = rank
    }
    
}
