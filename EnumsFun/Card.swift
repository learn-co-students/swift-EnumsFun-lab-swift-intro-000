//
//  Card.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

enum Suit: String {
    case Spades = "♠️"
    case Diamonds = "♦️"
    case Hearts = "♥️"
    case Clubs = "♣️"
    
    static let allValues = ["♠️", "♦️", "♥️", "♣️"]
}

enum Rank: Int {
    case two = 2
    case three = 3
    case four = 4
    case five = 5
    case six = 6
    case seven = 7
    case eight = 8
    case nine = 9
    case ten = 10
    case jack = 11
    case queen = 12
    case king = 13
    case ace = 14
    var stringValue: String {
        switch self {
        case .jack:
            return "J"
        case .queen:
            return "Q"
        case .king:
            return "K"
        case .ace:
            return "A"
        default:
            return "/(rawValue)"
        }
    }
    
    static let allValues = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
 
}

class Card {
    var suit: Suit
    var rank: Rank
    var description: String {
        return "/(rank)/(suit)"
    }
    init(rank: Rank, suit: Suit) {
        self.rank = rank
        self.suit = suit
    }
    
    static func == (card1: Card, card2: Card) -> Bool {
        return
            card1.description == card2.description
    }

    
}
