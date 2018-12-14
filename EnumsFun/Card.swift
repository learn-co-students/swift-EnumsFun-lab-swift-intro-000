//
//  Card.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

enum Suit: String {
    case spades = "♠️", diamonds = "♦️", hearts = "♥️", clubs = "♣️"

}

enum Rank: Int {
    case two = 2, three, four, five, six, seven, eight, nine, ten, jack, queen, king, ace
    
    var stringValue: String {
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
            return "\(RawValue)"
        }
    }
 
}

class Card {
    let suit: Suit
    let rank: Rank
    
    var description: String {
        return "\(rank.stringValue)\(suit.rawValue)"
    }
    
    init(rank: Rank, suit: Suit) {
        self.rank = rank
        self.suit = suit
    }

    
}
