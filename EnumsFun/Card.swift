//
//  Card.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

enum Suit: String {
    static let allSuits: [Suit] = [.spades, .hearts, .clubs, .diamonds]
    case spades = "♠️", hearts = "♥️", clubs = "♣️", diamonds = "♦️"

}

enum Rank: Int {
    static let allRanks: [Rank] = [.ace, .two, .three, .four, .five, .six, .seven, .eight, .nine, .ten, .jack, .queen, .king]
    
    var stringValue: String {
        switch self {
        case .jack: return "J"
        case .queen: return "Q"
        case .king: return "K"
        case .ace: return "A"
        default: return "\(rawValue)"
        }
    }
 
    case two = 2, three, four, five, six, seven, eight, nine, ten, jack, queen, king, ace
}

class Card {
    var suit: Suit
    var rank: Rank

    var description: String {
        return "\(rank.stringValue)\(suit.rawValue)"
    }
    
    
    init(rank: Rank, suit: Suit) {
        self.suit = suit
        self.rank = rank
    }
    
    static func ==(left: Card, right: Card) -> Bool {
        return left.description == right.description
    }
}
