//
//  Card.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation


enum Rank:Int {
    
    case two = 2, three, four, five, six, seven, eight, nine, ten, J, Q, K, A
    
    
    var stringValue:String {
        
        switch self {
        case .two:
            return "2"
        case .three:
            return "3"
        case .four:
            return "4"
        case .five:
            return "5"
        case .six:
            return "6"
        case .seven:
            return "7"
        case .eight:
            return "8"
        case .nine:
            return "9"
        case .ten:
            return "10"
        case .J:
            return "J"
        case .Q:
            return "Q"
        case .K:
            return "K"
        case .A:
            return "A"
        }
    }
}

enum Suit: String {
    case diamond = "♦︎",heart = "♥︎",spade = "♠︎",club = "♣︎"
    /*
    case diamond = "♦︎"
    case heart = "♥︎"
    case spade = "♠︎"
    case club = "♣︎"
    */
    
    var stringValue:String {
        
        switch self {
        case .diamond:
            return "♦︎"
        case .club:
            return "♣︎"
        case .heart:
            return "♥︎"
        case .spade:
            return "♠︎"
        }
    }
    
}

class Card {
    
    var suit:Suit
    var rank:Rank
    var description:String {
        
        return "\(rank.stringValue)\(suit.rawValue)"
    }
    init(rank:Rank,suit:Suit) {
        self.rank = rank
        self.suit = suit
    }
}

















