//
//  Card.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

enum Suit: String {
    case club = "♣️"
    case spade = "♠️"
    case heart = "♥️"
    case diamond = "♦️"
    
    var stringValue: String {
        switch self {
        case .club:
            return "♣️"
        case .spade:
            return "♠️"
        case .heart:
            return "♥️"
        case .diamond:
            return "♦️"
        }
    }
    
}

enum Rank: Int {
    case fourteen = 14
    case two = 2
    case three = 3
    case four = 4
    case five = 5
    case six = 6
    case seven = 7
    case eight = 8
    case nine = 9
    case ten = 10
    case eleven = 11
    case twelve = 12
    case thirteen = 13
    
    var stringValue: String {
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
        case .eleven:
            return "J"
        case .twelve:
            return "Q"
        case .thirteen:
            return "K"
        case .fourteen:
            return "A"
        }
    }
 
}

class Card: Equatable {
    let suit: Suit
    let rank: Rank
    var description: String {
        return "\(rank.stringValue)\(suit.stringValue)"
    }
    
    init(rank: Rank, suit: Suit){
        self.rank = rank
        self.suit = suit
    }
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.description == rhs.description
    }
    
}
