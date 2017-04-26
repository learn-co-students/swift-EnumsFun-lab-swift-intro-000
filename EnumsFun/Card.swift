//
//  Card.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

enum Suit: String {
    case hearts = "♥️"
    case diamonds = "♦️"
    case spades = "♠️"
    case clubs = "♣️"
    
    static let suits: [Suit] = [.hearts, .clubs, .diamonds, .spades]

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
    
    static let ranks: [Rank] = [.two, .three, .four, .five, .six, .seven, .eight, .nine, .ten, .jack, .queen, .king, .ace]
    
    var stringValue: String{
        switch self{
        case .jack:
            return "J"
        case .queen:
            return "Q"
        case .king:
            return "K"
        case .ace:
            return "A"
        default:
            return "\(self.rawValue)"
        }
    }
}

class Card: Equatable {
    let suit: Suit
    let rank: Rank
    var description: String{
        return "\(rank.stringValue)\(suit.rawValue)"
    }
    
    init(rank: Rank, suit: Suit){
        self.rank = rank
        self.suit = suit
    }
    
    static func ==(lhs: Card, rhs: Card) -> Bool{
        return lhs.description == rhs.description
    }
}
