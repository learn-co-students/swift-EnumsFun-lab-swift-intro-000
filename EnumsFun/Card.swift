//
//  Card.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

enum Suit: String {
    static let suits: [Suit] = [.spades, .hearts, .clubs, .diamonds]
    case spades = "♠️", hearts = "♥️", clubs = "♣️", diamonds = "♦️"
}

enum Rank: Int {
    static let ranks: [Rank] = [.ace, .two, .three, .four, .five, .six, .seven, .eight, .nine, .ten, .jack, .queen, .king]

    case two = 2, three, four, five, six, seven, eight, nine, ten, jack, queen, king, ace
    
    var stringValue : String {
        switch self {
        case .ace:
            return "A"
        case .king:
            return "K"
        case .queen:
            return "Q"
        case .jack:
            return "J"
        default:
            return "\(rawValue)"
        }
    }
}

class Card {
    let suit : Suit
    let rank : Rank
    var description: String  {
        return "\(rank)\(suit)"
    }
    
    init(suit: Suit, rank: Rank) {
        self.suit = suit
        self.rank = rank
    }
}
