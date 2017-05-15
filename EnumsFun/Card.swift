//
//  Card.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

enum Suit: String {
    
    static let suits: [Suit] = [.Spades, .Diamonds, .Clubs, .Hearts];
    
    case Spades = "♠️", Diamonds = "♦️", Hearts = "♥️", Clubs = "♣️";
}

enum Rank: Int {
    
    static let ranks: [Rank] = [.two, .three, .four, .five, .six, .seven, .eight, .nine, .ten, .jack, .queen, .king, .ace];
    
    case two = 2, three, four, five, six, seven, eight, nine, ten, jack, queen, king, ace;
    
    var stringValue: String {
        switch self {
            case .jack:
                return "J";
            case .queen:
                return "Q";
            case .king:
                return "K";
            case .ace:
                return "A";
            default:
                return "\(rawValue)";
        }
    }
}

class Card: Equatable {
    
    let suit: Suit;
    let rank: Rank;
    
    var description: String {
        return String(rank.stringValue) + suit.rawValue;
    }
    
    init(rank: Rank, suit: Suit) {
        self.rank = rank;
        self.suit = suit;
    }
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.description == rhs.description;
    }
    
}
