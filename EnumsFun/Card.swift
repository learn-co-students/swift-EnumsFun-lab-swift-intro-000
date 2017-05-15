//
//  Card.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

enum Suit: String {
    
    static let suits: [Suit] = [.spades, .clubs, .hearts, .diamonds]
    
    case spades = "♠️", clubs = "♣️", hearts = "♥️", diamonds = "♦️"
}

enum Rank: Int {
    
    static let ranks: [Rank] = [.two, .three, .four, .five, .six, .seven, .eight, .nine, .ten, .jack, .queen, .king, .ace]
    
    case two = 2, three, four, five, six, seven, eight, nine, ten, jack, queen, king, ace
    
    var stringValue: String {
        switch self {
        case .ace:
            return "A"
        case .jack:
            return "J"
        case .queen:
            return "Q"
        case .king:
            return "K"
        default:
            return "\(rawValue)"
        }
    }
 
}

class Card {
    var suit: Suit
    var rank: Rank
    var description: String {
        return rank.stringValue + suit.rawValue
    }

    init(rank: Rank, suit: Suit) {
        self.rank = rank
        self.suit = suit
    }
}
