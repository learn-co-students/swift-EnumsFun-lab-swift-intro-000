//
//  Card.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

enum Suit: String {
    case spade = "♠️"
    case clover = "♣️"
    case heart = "♥️"
    case diamond = "♦️"
    
    var StringValue: String {
        switch self {
        case .spade:
            return "♠️"
        case .clover:
            return "♣️"
        case .heart:
            return "♥️"
        case .diamond:
            return "♦️"
        }
    }
}

enum Rank: Int {
    
    case two = 2, three, four, five, six, seven, eight, nine, ten, jack, queen, king, ace
    
    var StringValue: String {
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
        case .jack:
            return "J"
        case .queen:
            return "Q"
        case .king:
            return "K"
        case .ace:
            return "A"
        }
    }
 
}

class Card {
    var suit: Suit
    var rank: Rank
    
    var description: String {
        return rank.StringValue + suit.StringValue
    }

    init(rank: Rank, suit: Suit) {
        self.rank = rank
        self.suit = suit
    }
}
